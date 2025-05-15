import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/feature/auth/data/repo/repo_register/repo_register_imple.dart';
import 'package:login_task_nti/feature/auth/presentation/manager/register_manager/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RepoRegisterImple registerImple;
  RegisterCubit(this.registerImple) : super(RegisterInitialState());

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  String? error;
  static RegisterCubit get(context) => BlocProvider.of(context);
   XFile? image;
  onPressedRegisterButton() async {
    error = null;
    if (!keyForm.currentState!.validate()) {
    error = "Please complete all fields.";
    emit(RegisterFailureState(error: error!));
    return;
  }

  if (passwordController.text != confirmPasswordController.text) {
    error = "Passwords must be identical.";
    emit(RegisterFailureState(error: error!));
    return;
  }
    emit(RegisterLoadingState());

    final result = await registerImple.registerUsers(
        userName: nameController.text, password: passwordController.text,image: image);

    result.fold((error) {
      print(error.message);
      emit(RegisterFailureState(error: error.message));
    }, (response) {
      emit(RegisterSuccessState());
    });
  }
}
