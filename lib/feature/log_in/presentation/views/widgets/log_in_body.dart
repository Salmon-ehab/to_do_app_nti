import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_image.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_text_span.dart';
import 'package:login_task_nti/feature/sign_in/presentation/views/sign_in_view.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            const CustomImage(),
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
            SizedBox(height: 30.h),
            CustomTextField(
              label: "Password",
              controller: passwordController,
              prefixIcon: SvgAssets.passwordIcon,
              isPassword: true,
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
            SizedBox(height: 30.h),
            CustomButton(
                onPressed: () {
                  if (!keyForm.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please try again!")));
                  }
                },
                textButton: "Login"),
            SizedBox(height: 30.h),
            const Material(
                color: Colors.transparent,
                child: CustomTextSpan(
                    text1: "Don’t Have An Account?  ",
                    text2: "Register",
                    routePage: SigninView())),
          ],
        ),
      ),
    );
  }
}
