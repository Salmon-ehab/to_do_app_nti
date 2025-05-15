import 'package:flutter/material.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/feature/auth/presentation/views/widgets/login_widgets/log_in_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: LogInBody(),
    );
  }
}