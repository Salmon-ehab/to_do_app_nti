import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/feature/add_task/data/repo/repo_add_tasl_imple.dart';
import 'package:login_task_nti/feature/add_task/presentation/manager/add_task_cubit/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.repoAddTaslImple) : super(AddTaskInitialState());
  final RepoAddTaslImple repoAddTaslImple;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  XFile? image;
  static AddTaskCubit get(context) => BlocProvider.of(context);

  void onAddTaskPressed() async {
    if (!key.currentState!.validate()) {
      return;
    }
    if (image == null) {
      emit(AddTaskErrorState(error: "please add photo"));
      return;
    }
    emit(AddTaskLoadingState());
    var result = await repoAddTaslImple.addTask(
        title: titleController.text,
        desc: descriptionController.text,
        image: image!);
    result.fold((error) {
      emit(AddTaskErrorState(error: error.toString()));
    }, (message) {
      emit(AddTaskSuccessState(message: message.message));
    });
  }
}
