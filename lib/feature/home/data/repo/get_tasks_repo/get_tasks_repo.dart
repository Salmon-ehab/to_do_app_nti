import 'package:dartz/dartz.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/feature/home/data/models/task_model_home.dart';

abstract class GetTasksRepo {
  Future<Either<Failure, List<TaskModelHome>>> getTask();
}