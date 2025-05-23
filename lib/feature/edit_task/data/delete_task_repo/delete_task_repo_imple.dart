import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/models/response_model.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';
import 'package:login_task_nti/feature/edit_task/data/delete_task_repo/delete_task_repo.dart';

class DeleteTaskRepoImple implements DeleteTaskRepo {
  final ApiConsumer apiConsumer;

  DeleteTaskRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, ResponseModel>> deleteTask(
      {required int id}) async {
    try {
      final response = await apiConsumer.delete("${EndPoints.deleteTask}$id",
          isProtected: true);
      ResponseModel responseModel = ResponseModel.fromJson(response);
      return Right(responseModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure("Incorrect email or password, try again."));
    }
  }
}
