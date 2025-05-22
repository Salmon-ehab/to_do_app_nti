import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/feature/edit_task/data/edit_task_repo/edit_task_repo_imple.dart';
import 'package:login_task_nti/feature/edit_task/presentation/manager/edit_task_cubit/edit_task_state.dart';
import 'package:login_task_nti/feature/home/data/models/task_model_home.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  final EditTaskRepoImple editTaskRepoImple;
  final TaskModelHome initialTask;

  EditTaskCubit({
    required this.editTaskRepoImple,
    required this.initialTask,
  }) : super(EditTaskInitialState()) {
    titleController.text = initialTask.title ?? '';
    descController.text = initialTask.description ?? '';
  }
  static EditTaskCubit get(context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  editTask({required int taskId}) async {
    if (key.currentState != null && !key.currentState!.validate()) {
    return;
  }

    emit(UpdateEditTaskLoadingState());
    var result = await editTaskRepoImple.editTask(
        id: taskId, title: titleController.text, desc: descController.text);
    result.fold((error) {
      emit(EditTaskFailureState(error: error.toString()));
      // print("error salma:$error");
    }, (response) {
      emit(EditTaskSuccessState(responseModel: response));
      // print("success:$response");
    });
  }
}
