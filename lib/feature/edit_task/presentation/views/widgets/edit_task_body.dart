import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/helper/my_responsive.dart';
import 'package:login_task_nti/feature/edit_task/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:login_task_nti/feature/edit_task/presentation/manager/edit_task_cubit/edit_task_state.dart';
import 'package:login_task_nti/feature/edit_task/presentation/views/widgets/update_button.dart';
import 'package:login_task_nti/feature/home/data/models/task_model_home.dart';
import 'package:login_task_nti/feature/home/presentation/views/home_view.dart';

class EditTaskBody extends StatelessWidget {
  final TaskModelHome taskModelHome;

  const EditTaskBody({super.key, required this.taskModelHome});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditTaskCubit, EditTaskState>(
        listener: (context, state) async {
      // GetTasksCubit.get(context).getTasksFromAPI();
      if (state is EditTaskSuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task Updated Successfully!')),
        );
        MyNavigator.goTo(screen: () => const HomeView(), isReplace: true);
        // await GetTasksCubit.get(context).getTasksFromAPI();
      } else if (state is EditTaskFailureState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update task: ${state.error}')),
        );
      }
    }, builder: (context, state) {
      return Form(
        key: EditTaskCubit.get(context).key,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 24, end: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(taskModelHome.imagePath!),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: MyResponsive.width(context, 230),
                    child: Text(
                      'Believe you can, and you\'re halfway there.',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: EditTaskCubit.get(context).titleController,
                  decoration: InputDecoration(
                    hintText: EditTaskCubit.get(context).titleController.text,
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: EditTaskCubit.get(context).descController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: EditTaskCubit.get(context).descController.text,
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),
              UpdateButton(onPressed: () {
                EditTaskCubit.get(context).editTask(taskId: taskModelHome.id!);
              })
            ],
          ),
        ),
      );
    });
  }
}
