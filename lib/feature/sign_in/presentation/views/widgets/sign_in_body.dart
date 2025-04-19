import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_text_span.dart';
import 'package:login_task_nti/feature/sign_in/presentation/views/widgets/sign_in_tetx_fiels.dart';
import 'package:login_task_nti/feature/log_in/presentation/views/log_in_view.dart';

class SigninBody extends StatefulWidget {
  const SigninBody({super.key});

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            SigninTetxFields(
                nameController: nameController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,),
            CustomButton(
                onPressed: () {
                  if (!keyForm.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please try again!")));
                  }
                },
                textButton: "Register"),
            SizedBox(height: 20.h),
         const  Material(
              color: Colors.transparent,
              child: CustomTextSpan(text1: "Already Have An Account?  ", text2: "LogIn", routePage: LogInView())
            ),

          ],
        ),
      ),
    );
  }
}
