// feature/edit_task/presentation/views/edit_task_view.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/network/dio_consumer.dart';
import 'package:login_task_nti/feature/edit_task/data/delete_task_repo/delete_task_repo_imple.dart'; // استيراد جديد
import 'package:login_task_nti/feature/edit_task/data/edit_task_repo/edit_task_repo_imple.dart';
import 'package:login_task_nti/feature/edit_task/presentation/manager/delete_task_cubit/delete_task_cubit.dart'; // استيراد جديد
import 'package:login_task_nti/feature/edit_task/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:login_task_nti/feature/edit_task/presentation/views/widgets/custom_appbar.dart'; // استيراد الـ AppBar
import 'package:login_task_nti/feature/edit_task/presentation/views/widgets/edit_task_body.dart';
import 'package:login_task_nti/feature/home/data/models/task_model_home.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.taskModelHome});
  final TaskModelHome taskModelHome;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditTaskCubit(
            editTaskRepoImple: EditTaskRepoImple(apiConsumer: DioConsumer(dio: Dio())),
            initialTask: taskModelHome,
          ),
        ),
        BlocProvider(
          create: (context) => DeleteTaskCubit(
            deleteTaskRepoImple: DeleteTaskRepoImple(apiConsumer: DioConsumer(dio: Dio())),
          ),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppbarEdit(taskId: taskModelHome.id), 
        body: EditTaskBody(
          taskModelHome: taskModelHome,
        ),
      ),
    );
  }
}