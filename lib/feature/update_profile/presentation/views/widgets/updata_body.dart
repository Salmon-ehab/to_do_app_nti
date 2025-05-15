import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/helper/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/core/widgets/image_manager/widget/image_view.dart';
import 'package:login_task_nti/feature/update_profile/presentation/manager/update_profile_manager.dart/update_profile_cubit.dart';
import 'package:login_task_nti/feature/update_profile/presentation/manager/update_profile_manager.dart/update_profile_state.dart';
import 'package:login_task_nti/generated/l10n.dart';

class UpdataBody extends StatelessWidget {
  const UpdataBody({super.key});

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<UpdateProfileCubit,UpdateProfileState>(builder: (context, state) {
                return CustomButton(onPressed: () {
                  UpdateProfileCubit.get(context).getUpdateProfile();
                }, textButton: S.of(context).Update);
          } )
        ],
      ),
    );
  }
}
