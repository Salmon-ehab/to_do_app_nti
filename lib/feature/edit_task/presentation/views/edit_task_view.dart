import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/feature/edit_task/data/edit_task_repo/edit_task_repo_imple.dart';
import 'package:login_task_nti/feature/edit_task/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:login_task_nti/feature/edit_task/presentation/views/widgets/edit_task_body.dart';
import 'package:login_task_nti/feature/home/data/models/task_model_home.dart';

import '../../../../core/network/dio_consumer.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.taskModelHome});
  final TaskModelHome taskModelHome;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditTaskCubit(
          editTaskRepoImple:
              EditTaskRepoImple(apiConsumer: DioConsumer(dio: Dio())),
          initialTask: taskModelHome),
      child: Scaffold(
        body: EditTaskBody(
          taskModelHome: taskModelHome,
        ),
      ),
    );
  }
}
