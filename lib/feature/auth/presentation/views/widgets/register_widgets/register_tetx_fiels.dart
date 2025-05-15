import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/core/helper/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/core/widgets/image_manager/widget/image_view.dart';
import 'package:login_task_nti/generated/l10n.dart';

class SigninTetxFields extends StatelessWidget {
  const SigninTetxFields({
    super.key,
    required this.nameController,
    required this.passwordController,
    required this.confirmPasswordController, required this.pickImage,
  });
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final  void Function(XFile)? pickImage ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const AspectRatio(
        //   aspectRatio: 1.2,
        //   child: CustomImage(),
        // ),
        CustomImageView(pickImage:pickImage!, ),
        const SizedBox(height: 23),
        CustomTextField(
            label: S.of(context).Username,
            controller: nameController,
            prefixIcon: SvgAssets.profileIcon,
            validator: ValidatorFormField.validateName),
        const SizedBox(height: 10),
        CustomTextField(
            label: S.of(context).Password,
            isPassword: true,
            controller: passwordController,
            prefixIcon: SvgAssets.passwordIcon,
            validator: ValidatorFormField.validatePassword),
        const SizedBox(height: 10),
        CustomTextField(
            label: S.of(context).ConfirmPassword,
            isPassword: true,
            controller: confirmPasswordController,
            prefixIcon: SvgAssets.passwordIcon,
            validator: ValidatorFormField.validateConfirmPassword),
        const SizedBox(height: 23),
      ],
    );
  }

  borderFunction(Color color1) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(
          color: color1,
        ));
  }
}
