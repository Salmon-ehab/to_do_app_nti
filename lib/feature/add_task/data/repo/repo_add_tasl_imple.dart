import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';
import 'package:login_task_nti/feature/add_task/data/models/task_model.dart';
import 'package:login_task_nti/feature/add_task/data/repo/repo_add_task.dart';
import 'package:login_task_nti/feature/auth/data/models/response_register_model.dart';

class RepoAddTaslImple implements RepoAddTask {
  final ApiConsumer apiConsumer;

  RepoAddTaslImple({required this.apiConsumer}) : super();
  @override
  Future<Either<Failure, ResponseRegisterModel>> addTask(
      {required String title,
      required String desc,
      required XFile image}) async {
    try {
      final task = TaskModel(title: title, desc:desc, image: image);
      final data = await task.toFormData();
      

      final response = await apiConsumer.post(EndPoints.addTask,
          data: data,
          isFormData: true,
          isProtected: true);
      print("salmaaaaa:$response ");
      ResponseRegisterModel responseRegisterModel =
          ResponseRegisterModel.fromJson(response);

      return Right(responseRegisterModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
