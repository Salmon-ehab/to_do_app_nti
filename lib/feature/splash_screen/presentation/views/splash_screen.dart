import 'package:flutter/material.dart';
import 'package:login_task_nti/feature/splash_screen/presentation/views/widget/splash_widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}