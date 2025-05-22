import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';
import 'package:login_task_nti/feature/home/data/models/task_model_home.dart';
import 'package:login_task_nti/feature/home/data/repo/get_tasks_repo/get_tasks_repo.dart';

class GetTaskRepoImple implements GetTasksRepo {
  final ApiConsumer apiConsumer;

  GetTaskRepoImple({required this.apiConsumer});
 @override
Future<Either<Failure, List<TaskModelHome>>> getTask() async {
  try {
    final response =
        await apiConsumer.get(EndPoints.getTasks, isProtected: true);

    // print("tasks: $response");

    if (response["status"] != null && response["status"] == true) {
      final List tasksJson = response["tasks"] ?? [];

      List<TaskModelHome> tasks = [];

      for (int i = 0; i < tasksJson.length; i++) {
        final task = TaskModelHome.fromJson(tasksJson[i]);
        tasks.add(task);
      }
          print("salma $tasks");
      return Right(tasks);
    } else {
      throw Exception("Failed to fetch tasks.\nTry again later.");
    }
  } on DioException catch (e) {
    final error = AppException.fromDio(e);
    return Left(Failure(error.message));
  } catch (e) {
    return Left(Failure(e.toString()));
  }
}
}
