import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/network/dio_consumer.dart';
import 'package:login_task_nti/feature/update_profile/data/repo/update_repo_imple.dart';
import 'package:login_task_nti/feature/update_profile/presentation/manager/update_profile_manager.dart/update_profile_cubit.dart';
import 'package:login_task_nti/feature/update_profile/presentation/views/widgets/updata_body.dart';

class UpdataProfileView extends StatelessWidget {
  const UpdataProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(UpdateRepoImple(apiConsumer: DioConsumer(dio: Dio()))),
      child: const Scaffold(
        body: UpdataBody(),
      ),
    );
  }
}