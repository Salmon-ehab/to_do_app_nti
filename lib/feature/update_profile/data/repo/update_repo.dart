import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/models/response_model.dart';

 abstract class UpdateRepo {
  Future<Either<Failure,ResponseModel>> updateProfile({required String userName, required XFile image});
}