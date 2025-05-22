import 'package:login_task_nti/core/models/response_model.dart';

abstract class EditTaskState {}

class EditTaskInitialState extends EditTaskState {}

class UpdateEditTaskLoadingState extends EditTaskState {}

class EditTaskSuccessState extends EditTaskState {
  final ResponseModel responseModel;

  EditTaskSuccessState({required this.responseModel});
}

class EditTaskFailureState extends EditTaskState {
  final String error;

  EditTaskFailureState({required this.error});
}
