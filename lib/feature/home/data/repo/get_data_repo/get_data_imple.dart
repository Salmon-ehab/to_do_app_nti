import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';
import 'package:login_task_nti/feature/home/data/models/login_response_model.dart';
import 'package:login_task_nti/feature/home/data/models/user_model.dart';
import 'package:login_task_nti/feature/home/data/repo/get_data_repo/get_data_repo.dart';

class GetDataRepoImple implements GetDataRepo {
  final ApiConsumer apiConsumer;
  GetDataRepoImple(this.apiConsumer) : super();
  @override
  Future<Either<Failure, UserModel>> getData() async {
    try {
      final response =
          await apiConsumer.get(EndPoints.getUserData, isProtected: true);
// print("📦 Raw API Response: $response");
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(response);
      if (loginResponseModel.status != null &&
          loginResponseModel.status == true) {
        // return user model
        if (loginResponseModel.user != null) {
          return Right(loginResponseModel.user!);
        } else {
          throw Exception("Login Failed\nTry Again later");
        }
      } else {
        throw Exception("Login Failed\nTry Again later");
      }
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {

  return Left(Failure(e.toString()));
    }
  }
}
