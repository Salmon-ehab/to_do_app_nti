import 'package:login_task_nti/core/models/response_model.dart';

abstract class DeleteUserState {}

class DeleteUserInitState extends DeleteUserState {}

class DeleteUserSuccessState extends DeleteUserState {
  final ResponseModel responseModel;
  DeleteUserSuccessState(this.responseModel);
}

class DeleteUserErrorState extends DeleteUserState {
  String error;
  DeleteUserErrorState({required this.error});
}
