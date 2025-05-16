import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';
import 'package:login_task_nti/feature/auth/data/models/response_register_model.dart';
import 'package:login_task_nti/feature/auth/data/repo/repo_register/repo_register.dart';

class RepoRegisterImple implements RepoRegister {
  final ApiConsumer apiConsumer;
// TODO :WRS
  RepoRegisterImple({required this.apiConsumer}) : super();
  @override
  Future<Either<Failure, ResponseRegisterModel>> registerUsers(
      {required String userName,
      required String password,
      required XFile? image}) async {
    try {
      final response = await apiConsumer.post(EndPoints.register, data: {
        'username': userName,
        "password": password,
        "image":image ==null?null: await MultipartFile.fromFile(image.path)
      });
      ResponseRegisterModel responseRegisterModel =
          ResponseRegisterModel.fromJson(response);
      // if (responseRegisterModel.status == false) {
      //   return Left(Failure("Username already exists"));
      // }
     // print("salma:$response");
      return Right(responseRegisterModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure("Username already exists"));
    }
  }
}
