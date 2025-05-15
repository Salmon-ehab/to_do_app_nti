import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/feature/auth/data/models/response_register_model.dart';

abstract class RepoAddTask {
  Future<Either<Failure, ResponseRegisterModel>> addTask(
      {required String title,required String desc,required XFile  image});
}
