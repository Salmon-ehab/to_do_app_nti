import 'package:login_task_nti/core/models/response_model.dart';

abstract class DeleteTaskState {}

class DeleteTaskInitialState extends DeleteTaskState {}

class DeleteTaskTaskLoadingState extends DeleteTaskState {}

class DeleteTaskSuccessState extends DeleteTaskState {
  final ResponseModel responseModel;

  DeleteTaskSuccessState({required this.responseModel});
}

class DeleteTaskFailureState extends DeleteTaskState {
  final String error;

  DeleteTaskFailureState({required this.error});
}
