import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/helper/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/core/widgets/image_manager/widget/image_view.dart';
import 'package:login_task_nti/feature/home/presentation/views/home_view.dart';
import 'package:login_task_nti/feature/update_profile/presentation/manager/update_profile_manager.dart/update_profile_cubit.dart';
import 'package:login_task_nti/feature/update_profile/presentation/manager/update_profile_manager.dart/update_profile_state.dart';
import 'package:login_task_nti/generated/l10n.dart';

import '../../../../home/presentation/manager/user_cubit/user_cubit.dart';

class UpdataBody extends StatelessWidget {
  const UpdataBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is UpdateSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Profile updated successfully")),
          );
          MyNavigator.goto(context, screen: HomeView());
        }
      },
      builder: (context, state) {
        return Form(
          key: UpdateProfileCubit.get(context).key,
          child: Column(
            children: [
              // const CustomImage(),
              CustomImageView(pickImage: (pickimage) {
                UpdateProfileCubit.get(context).image = pickimage;
              }),
              SizedBox(height: 23.h),
              CustomTextField(
                label: S.of(context).Username,
                controller: UpdateProfileCubit.get(context).nameController,
                validator: ValidatorFormField.validateName,
              ),
              SizedBox(height: 27.h),

              CustomButton(
                  onPressed: () {
                    UpdateProfileCubit.get(context).getUpdateProfile();
                    UserCubit.get(context).getUserDataFromAPI();
                  },
                  textButton: S.of(context).Update)
            ],
          ),
        );
      },
    );
  }
}
