import 'package:dartz/dartz.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/feature/home/data/models/login_response_model.dart';

abstract class RepoLogin {
  Future<Either<Failure, LoginResponseModel>> loginWithEmailAndPassword(
      {required String name,required String password});
}
