import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/models/response_model.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';
import 'package:login_task_nti/feature/settings/data/delete_user_repo/delete_user_repo.dart';

class DeleteUserRepoImple implements DeleteUserRepo {
  final ApiConsumer apiConsumer;

  DeleteUserRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, ResponseModel>> deleteUser() async {
    try {
      final response =
          await apiConsumer.delete(EndPoints.deleteUser, isProtected: true);
      ResponseModel responseModel = ResponseModel.fromJson(response);
      if ( responseModel.status == true) {
        return Right(responseModel);
      }else{
        throw Exception("An error occured");
      }
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
