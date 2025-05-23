import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/feature/changed_password/data/repo/change_password_repo_imple.dart';
import 'package:login_task_nti/feature/changed_password/presentation/manager/change_password_cubit.dart/change_password_state.dart';

class ChangePaswwordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepoImple changePasswordRepoImple;
  ChangePaswwordCubit(this.changePasswordRepoImple)
      : super(ChangePasswordInitialState());

  static ChangePaswwordCubit get(context) => BlocProvider.of(context);
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  String? error;
  onPressedChangePasswordButton() async {
    error = null;
    if (!key.currentState!.validate()) {
      error = "Please complete all fields.";
      emit(ChangePasswordFailureState(error: error!));
      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      error = "Passwords must be identical.";
      emit(ChangePasswordFailureState(error: error!));
      return;
    }
    emit(ChangePasswordLoadingState());

    final result = await changePasswordRepoImple.changePassword(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
        newPasswordConfirm: confirmPasswordController.text);

    result.fold((error) {
      emit(ChangePasswordFailureState(error: error.message));
    }, (response) {
      emit(ChangePasswordSuccessState(responseModel: response));
    });
  }
}
