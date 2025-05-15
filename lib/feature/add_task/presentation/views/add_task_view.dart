import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/network/dio_consumer.dart';
import 'package:login_task_nti/core/widgets/custom_appbar_widget2.dart';
import 'package:login_task_nti/feature/add_task/data/repo/repo_add_tasl_imple.dart';
import 'package:login_task_nti/feature/add_task/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:login_task_nti/feature/add_task/presentation/views/widgets/add_task_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> AddTaskCubit(RepoAddTaslImple(apiConsumer: DioConsumer(dio: Dio()))),
      child: const  Scaffold(
        appBar: CustomAppbarWidget2(appbarTitle: "Add Task"),
        body: AddTaskBody(),
      ),
    );
  }
}