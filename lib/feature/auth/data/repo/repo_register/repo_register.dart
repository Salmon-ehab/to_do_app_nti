import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/feature/auth/data/models/response_register_model.dart';

abstract class RepoRegister {
  Future<Either<Failure, ResponseRegisterModel>> registerUsers(
      {required String userName,
      required String password,
      required XFile? image
      });
}
