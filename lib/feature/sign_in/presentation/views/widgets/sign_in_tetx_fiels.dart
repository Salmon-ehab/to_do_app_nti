import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/core/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_image.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/generated/l10n.dart';

class SigninTetxFields extends StatefulWidget {
  const SigninTetxFields(
      {super.key,
      required this.nameController,
      required this.passwordController,
      required this.confirmPasswordController,
     });
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<SigninTetxFields> createState() => _SigninTetxFieldsState();
}

class _SigninTetxFieldsState extends State<SigninTetxFields> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomImage(),
        SizedBox(height: 23.h),
        CustomTextField(
          label:  S.of(context).Username,
          controller: widget.nameController,
          prefixIcon: SvgAssets.profileIcon,
          validator: ValidatorFormField.validateName
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          label:  S.of(context).Password,
          isPassword: true,
          controller: widget.passwordController,
          prefixIcon: SvgAssets.passwordIcon,
          validator:ValidatorFormField.validatePassword
        ),
        SizedBox(height: 10.h),
        CustomTextField(
          label:  S.of(context).ConfirmPassword,
          isPassword: true,
          controller: widget.confirmPasswordController,
          prefixIcon: SvgAssets.passwordIcon,
          validator: ValidatorFormField.validateConfirmPassword
        ),
        SizedBox(height: 23.h),
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
