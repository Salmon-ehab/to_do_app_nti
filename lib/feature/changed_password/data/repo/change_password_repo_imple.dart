import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/models/response_model.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';
import 'package:login_task_nti/feature/changed_password/data/repo/change_password_repo.dart';

class ChangePasswordRepoImple implements ChangePasswordRepo {
  final ApiConsumer apiConsumer;

  ChangePasswordRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, ResponseModel>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String newPasswordConfirm}) async {
    try {
      final response = await apiConsumer
          .post(EndPoints.changePassword, isProtected: true, data: {
        'current_password': oldPassword,
        "new_password": newPassword,
        "new_password_confirm": newPasswordConfirm
      });
      ResponseModel responseModel = ResponseModel.fromJson(response);
      return Right(responseModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
