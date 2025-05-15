import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:login_task_nti/core/cache/cache_helper.dart';
import 'package:login_task_nti/core/cache/cache_key.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';
import 'package:login_task_nti/feature/auth/data/repo/repo_login/repo_login.dart';
import 'package:login_task_nti/feature/home/data/models/login_response_model.dart';

class RepoLoginImplementaiton implements RepoLogin {
  final ApiConsumer apiConsumer;

  RepoLoginImplementaiton({required this.apiConsumer}) : super();

  @override
  Future<Either<Failure, LoginResponseModel>> loginWithEmailAndPassword({
    required String name,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.post(EndPoints.login,
          data: {'username': name, 'password': password});
      // await CacheHelper.saveData(
      //     key: "accessToken", value: response["access_token"]);
      // await CacheHelper.saveData(
      //     key: "refreshToken", value: response["refresh_token"]);
      await CacheHelper.saveData(
          key: CacheKey.accessToken, value: response["access_token"]);
      // print( response["access_token"]);
      // print(CacheHelper.getData(key: CacheKey.accessToken));
      await CacheHelper.saveData(
          key: CacheKey.refreshToken, value: response["refresh_token"]);
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response);
      //    print("salma:${response["status"]}");
      return Right(loginResponseModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure("Incorrect email or password, try again."));
    }
  }
}
