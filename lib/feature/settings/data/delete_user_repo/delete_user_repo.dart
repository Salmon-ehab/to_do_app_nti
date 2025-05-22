import 'package:dartz/dartz.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/models/response_model.dart';

abstract class DeleteUserRepo {
  Future<Either<Failure, ResponseModel>> deleteUser();
}
