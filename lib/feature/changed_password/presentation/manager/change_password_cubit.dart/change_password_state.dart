import 'package:login_task_nti/core/models/response_model.dart';

abstract class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordFailureState extends ChangePasswordState {
  final String error;
  ChangePasswordFailureState({required this.error});
}

class ChangePasswordSuccessState extends ChangePasswordState {
  final ResponseModel responseModel;

  ChangePasswordSuccessState({required this.responseModel});
}
