import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/network/dio_consumer.dart';
import 'package:login_task_nti/feature/changed_password/data/repo/change_password_repo_imple.dart';
import 'package:login_task_nti/feature/changed_password/presentation/manager/change_password_cubit.dart/change_paswword_cubit.dart';
import 'package:login_task_nti/feature/changed_password/presentation/views/widgets/changed_password_body.dart';

class ChangedPasswordView extends StatelessWidget {
  const ChangedPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePaswwordCubit(
          ChangePasswordRepoImple(apiConsumer: DioConsumer(dio: Dio()))),
      child: const Scaffold(
        body: ChangedPasswordBody(),
      ),
    );
  }
}
