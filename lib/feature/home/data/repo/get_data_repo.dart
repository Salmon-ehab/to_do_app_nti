import 'package:dartz/dartz.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/feature/home/data/models/user_model.dart';
abstract 
class GetDataRepo {
  Future<Either<Failure,UserModel>> getData();
}