import 'package:flutter/material.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/feature/sign_in/presentation/views/widgets/sign_in_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SigninBody(),
    );
  }
}
