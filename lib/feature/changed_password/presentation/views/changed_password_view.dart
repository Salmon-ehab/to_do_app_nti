import 'package:flutter/material.dart';
import 'package:login_task_nti/feature/changed_password/presentation/views/widgets/changed_password_body.dart';

class ChangedPasswordView extends StatelessWidget {
  const ChangedPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChangedPasswordBody(),
    );
  }
}
