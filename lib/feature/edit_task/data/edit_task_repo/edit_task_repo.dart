import 'package:dartz/dartz.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/models/response_model.dart';

abstract class EditTaskRepo {
  Future<Either<Failure, ResponseModel>> editTask(
      {required String title, required String desc,required int id});
}
