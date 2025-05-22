import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/network/dio_consumer.dart';
import 'package:login_task_nti/feature/home/data/repo/get_tasks_repo/get_task_repo_imple.dart';
import 'package:login_task_nti/feature/home/presentation/manager/get_tasks_manager/get_tasks_cubit.dart';
import 'package:login_task_nti/feature/home/presentation/views/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> GetTasksCubit(GetTaskRepoImple(apiConsumer: DioConsumer(dio: Dio())))..getTasksFromAPI(),
      child: const Scaffold(
        body: HomeBody(),
      ),
    );
  }
}
