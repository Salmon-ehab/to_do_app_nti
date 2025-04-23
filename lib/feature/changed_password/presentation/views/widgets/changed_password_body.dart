import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_image.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/generated/l10n.dart';

class ChangedPasswordBody extends StatefulWidget {
  const ChangedPasswordBody({super.key});

  @override
  State<ChangedPasswordBody> createState() => _ChangedPasswordBodyState();
}

class _ChangedPasswordBodyState extends State<ChangedPasswordBody> {
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomImage(),
          SizedBox(height: 23.h),
          CustomTextField(
              label: S.of(context).OldPassword,
              controller: oldPasswordController,
              validator: ValidatorFormField.validatePassword),
          SizedBox(height: 10.h),
          CustomTextField(
              label:  S.of(context).NewPassword,
              controller: newPasswordController,
              validator: ValidatorFormField.validatePassword),
          SizedBox(height: 10.h),
          CustomTextField(
              label:  S.of(context).ConfirmPassword,
              controller: confirmPasswordController,
              validator: ValidatorFormField.validateConfirmPassword),
          SizedBox(height: 23.h),
          CustomButton(onPressed: () {}, textButton:  S.of(context).Save)
        ],
      ),
    );
  }
}
