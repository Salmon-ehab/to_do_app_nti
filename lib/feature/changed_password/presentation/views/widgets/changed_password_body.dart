import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/helper/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_image.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/feature/changed_password/presentation/manager/change_password_cubit.dart/change_paswword_cubit.dart';
import 'package:login_task_nti/generated/l10n.dart';

class ChangedPasswordBody extends StatelessWidget {
  const ChangedPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: ChangePaswwordCubit.get(context).key,
        child: Column(
          children: [
            const CustomImage(),
            SizedBox(height: 23.h),
            CustomTextField(
                label: S.of(context).OldPassword,
                controller: ChangePaswwordCubit.get(context).oldPasswordController,
                validator: ValidatorFormField.validatePassword),
            SizedBox(height: 10.h),
            CustomTextField(
                label:  S.of(context).NewPassword,
                controller:ChangePaswwordCubit.get(context).newPasswordController,
                validator: ValidatorFormField.validatePassword),
            SizedBox(height: 10.h),
            CustomTextField(
                label:  S.of(context).ConfirmPassword,
                controller: ChangePaswwordCubit.get(context).confirmPasswordController,
                validator: ValidatorFormField.validateConfirmPassword),
            SizedBox(height: 23.h),
            CustomButton(onPressed: () {}, textButton:  S.of(context).Save)
          ],
        ),
      ),
    );
  }
}
