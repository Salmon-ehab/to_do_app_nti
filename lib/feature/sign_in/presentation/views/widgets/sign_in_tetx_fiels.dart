import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/core/widgets/custom_image.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';

class SigninTetxFields extends StatelessWidget {
  const SigninTetxFields(
      {super.key,
      required this.nameController,
      required this.passwordController,
      required this.confirmPasswordController});
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      const  CustomImage(),
        SizedBox(height: 30.h),
        CustomTextField(
          label: "Username",
          controller: nameController,
          prefixIcon: SvgAssets.profileIcon,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Please Enter user name!";
            }
            if (value.length < 4) {
              return "User name must be at least 4 characters.";
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          label: "Password",
          isPassword: true,
          controller: passwordController,
          prefixIcon: SvgAssets.passwordIcon,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter password!";
            }
            if (value.length < 5) {
              return "Password must be at least 5 characters.";
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          label: "Confirm password",
          isPassword: true,
          controller: confirmPasswordController,
          prefixIcon: SvgAssets.passwordIcon,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter confirm password!";
            }
            if (value.length < 5) {
              return "Confirm Password must be at least 5 characters.";
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
