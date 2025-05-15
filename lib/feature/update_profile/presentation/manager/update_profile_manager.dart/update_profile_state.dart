import 'package:login_task_nti/core/models/response_model.dart';

abstract class UpdateProfileState {}

class UpdateInitialState extends UpdateProfileState {}

class UpdateLoadingState extends UpdateProfileState {}

class UpdateSuccessState extends UpdateProfileState {
  final ResponseModel responseModel;

  UpdateSuccessState({required this.responseModel});
}

class UpdateFailureState extends UpdateProfileState {
  final String error;

  UpdateFailureState({required this.error});
}
