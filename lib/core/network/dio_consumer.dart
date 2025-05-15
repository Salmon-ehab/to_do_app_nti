import 'package:dio/dio.dart';
import 'package:login_task_nti/core/cache/cache_data.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          //  print("--headers:${options.headers.toString()}");
          return handler.next(options);
        },
        onError: (options, handler) {}));
  }
  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    bool isFormData = true,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data,
      Map<String, dynamic>? queryParameter,
      bool isProtected = false}) async {
    try {
      final response = await dio.get(path,
          data: data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameter,
    bool isFormData = true,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameter,
      );
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
      bool isProtected = false}) async {
    try {
      final response = await dio.post(path,
          data: isFormData
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
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
      bool isProtected = false}) async {
    try {
      final response = await dio.put(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameter,
          options: Options(headers: {
            if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
          }));
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  void handleDioExceptions(DioException e) {
    final error = AppException.fromDio(e);
    print(error);
    throw error;
  }
}
