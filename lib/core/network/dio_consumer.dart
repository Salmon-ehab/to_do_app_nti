import 'package:dio/dio.dart';
import 'package:login_task_nti/core/cache/cache_data.dart';
import 'package:login_task_nti/core/cache/cache_helper.dart';
import 'package:login_task_nti/core/cache/cache_key.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';
import 'package:login_task_nti/feature/auth/presentation/views/log_in_view.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("--- Headers : ${options.headers.toString()}");
        print("--- Endpoint : ${options.path.toString()}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("--- Response : ${response.data.toString()}");
        return handler.next(response);
      },
      onError: (DioException error, handler) async {
        print("--- Error : ${error.response?.data.toString()}");

        final message = error.response?.data['message'] ?? '';

        if (message.toString().toLowerCase().contains('expired')) {
          final refreshToken = CacheData.refreshToken ??
              CacheHelper.getData(key: CacheKey.refreshToken);

          if (refreshToken == null) {
            _logoutUser();
            return handler.next(error);
          }

          try {
            final refreshTokenResponse = await dio.post(
              EndPoints.refreshToken,
              options: Options(
                headers: {'Authorization': 'Bearer $refreshToken'},
              ),
            );

            if (refreshTokenResponse.data != null &&
                refreshTokenResponse.data['status'] == true) {
              final newAccessToken =
                  refreshTokenResponse.data['data']['access_token'];

              CacheData.accessToken = newAccessToken;
              await CacheHelper.saveData(
                  key: CacheKey.accessToken, value: newAccessToken);

              final options = error.requestOptions;

              // Handle if request is FormData
              if (options.data is FormData) {
                final oldFormData = options.data as FormData;
                final Map<String, dynamic> formMap = {};

                for (var entry in oldFormData.fields) {
                  formMap[entry.key] = entry.value;
                }

                for (var file in oldFormData.files) {
                  formMap[file.key] = file.value;
                }

                options.data = FormData.fromMap(formMap);
              }

              options.headers['Authorization'] = 'Bearer $newAccessToken';
              final response = await dio.fetch(options);
              return handler.resolve(response);
            } else {
              _logoutUser();
              return handler.next(error);
            }
          } catch (e) {
            _logoutUser();
            return handler.next(error);
          }
        }

        return handler.next(error);
      },
    ));
  }

  void _logoutUser() {
    CacheHelper.removeData(key: CacheKey.accessToken);
    CacheHelper.removeData(key: CacheKey.refreshToken);
    MyNavigator.goTo(screen: () => const LogInView(), isReplace: true);
  }

  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = true,
      bool isProtected = false,
      bool sendRefreshToken = false}) async {
    try {
      final response = await dio.delete(path,
          data: data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected)
              'Authorization':
                  'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameter,
      bool isProtected = false,
      bool sendRefreshToken = false}) async {
    try {
      final response = await dio.get(path,
          data: data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected)
              'Authorization':
                  'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = true,
      bool isProtected = false,
      bool sendRefreshToken = false}) async {
    try {
      final response = await dio.patch(path,
          data: isFormData && data is! FormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected)
              'Authorization':
                  'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = true,
      bool isProtected = false,
      bool sendRefreshToken = false}) async {
    try {
      final response = await dio.post(path,
          data: isFormData && data is! FormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected)
              'Authorization':
                  'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future put(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameter,
      bool isFormData = true,
      bool isProtected = false,
      bool sendRefreshToken = false}) async {
    try {
      final response = await dio.put(path,
          data: isFormData && data is! FormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data,
          queryParameters: queryParameter,
          options: Options(headers: {
            'Authorization':
                'Bearer ${sendRefreshToken ? CacheHelper.getData(key: CacheKey.refreshToken) : CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  void handleDioExceptions(DioException e) {
    final error = AppException.fromDio(e);
    throw error;
  }
}
