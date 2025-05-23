import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/feature/edit_task/presentation/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:login_task_nti/feature/edit_task/presentation/manager/delete_task_cubit/delete_task_state.dart';
import 'package:login_task_nti/feature/home/presentation/views/home_view.dart'; // هنحتاج الـ state عشان نعمل listener

class CustomAppbarEdit extends StatelessWidget implements PreferredSizeWidget {
  final int? taskId;

  const CustomAppbarEdit({super.key, this.taskId});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[100],
      elevation: 0,
      leading: Transform.rotate(
        angle: Intl.getCurrentLocale().startsWith('en') ? 3.1416 : 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            SvgAssets.arrowIcon,
            height: 21.h,
            width: 21.w,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            MyNavigator.pop(context);
          },
        ),
      ),
      title: const Text(
        'Edit Task',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
            listener: (context, state) {
              if (state is DeleteTaskSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Task Deleted Successfully!')),
                );
                MyNavigator.goTo(
                    screen: () => const HomeView(), isReplace: true);
                // GetTasksCubit.get(context).getTasksFromAPI();
              } else if (state is DeleteTaskFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Failed to delete task: ${state.error}')),
                );
              } else if (state is DeleteTaskTaskLoadingState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Deleting task...')),
                );
              }
            },
            builder: (context, state) {
              return ElevatedButton.icon(
                onPressed: () {
                  if (taskId != null) {
                    DeleteTaskCubit.get(context).deleteTask(taskId: taskId!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Cannot delete task: Task ID is missing.')),
                    );
                  }
                },
                icon: (state is DeleteTaskTaskLoadingState)
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.delete, color: Colors.white),
                label: (state is DeleteTaskTaskLoadingState)
                    ? const Text('Deleting...',
                        style: TextStyle(color: Colors.white))
                    : const Text('Delete',
                        style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
