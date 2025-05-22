import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/core/errors/app_exception.dart';
import 'package:login_task_nti/core/errors/failure.dart';
import 'package:login_task_nti/core/models/response_model.dart';
import 'package:login_task_nti/core/network/api_consumer.dart';
import 'package:login_task_nti/core/network/end_points.dart';
import 'package:login_task_nti/feature/update_profile/data/repo/update_repo.dart';

class UpdateRepoImple implements UpdateRepo {
  final ApiConsumer apiConsumer;

  UpdateRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, ResponseModel>> updateProfile(
      {required String userName, required XFile image}) async {
    try {
      final response = await apiConsumer.put(EndPoints.updateProfile,
          data: {'username': userName, 'image': image}, isProtected: true);
      // print("salma :$response");
      ResponseModel responseModel = ResponseModel.fromJson(response);
      return Right(responseModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      // print("salma :${e.toString()}");

      return Left(Failure("Incorrect email or password, try again."));
    }
  }
}
