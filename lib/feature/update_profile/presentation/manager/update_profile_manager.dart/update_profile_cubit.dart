import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/feature/update_profile/data/repo/update_repo_imple.dart';
import 'package:login_task_nti/feature/update_profile/presentation/manager/update_profile_manager.dart/update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateRepoImple updateRepoImple;
  UpdateProfileCubit(this.updateRepoImple) : super(UpdateInitialState());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  XFile? image;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  getUpdateProfile() async {
    if (!key.currentState!.validate()) {
      if (image == null) {
        emit(UpdateFailureState(error: "please add photo"));
        return;
      }
    }
    emit(UpdateLoadingState());
    var result = await updateRepoImple.updateProfile(
        userName: nameController.text, image: image!);
    result.fold((error) {
      emit(UpdateFailureState(error: error.toString()));
    }, (response) {
      emit(UpdateSuccessState(responseModel: response));
    });
  }
}
