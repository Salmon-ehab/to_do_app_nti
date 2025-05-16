import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/cache/cache_helper.dart';
import 'package:login_task_nti/core/cache/cache_key.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/feature/home/presentation/manager/get_tasks_manager/get_tasks_cubit.dart';
import 'package:login_task_nti/feature/home/presentation/manager/get_tasks_manager/get_tasks_state.dart';
import 'package:login_task_nti/feature/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:login_task_nti/feature/home/presentation/views/widgets/task_widget.dart';
import 'package:login_task_nti/generated/l10n.dart';

class TasksFile extends StatefulWidget {
  const TasksFile({super.key});

  @override
  State<TasksFile> createState() => _TasksFileState();
}

class _TasksFileState extends State<TasksFile> {
   @override
     void initState() {
    super.initState();
    GetTasksCubit.get(context).getTasksFromAPI();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTasksCubit, GetTasksState>(
      listener: (context, state) {
        UserCubit.get(context).getUserDataFromAPI();
        print(CacheHelper.getData(key: CacheKey.accessToken));
        if (state is GetTasksSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            'Tasks Success',
            style: TextStyle(color: AppColor.green),
          )));
        }
        if (state is GetTasksFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            state.error,
            style: const TextStyle(color: Colors.red),
          )));
        }
      },
      builder: (context, state) {
        if (state is GetTasksLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
          child: Column(
            children: [
              SizedBox(height: 54.h),
              Row(
                children: [
                  Text(S.of(context).tasks,
                      style: Styles.textStyle14.copyWith(
                          color: AppColor.coolBlack,
                          fontWeight: FontWeight.w300)),
                  Container(
                    height: 20.h,
                    width: 20.w,
                    margin: EdgeInsetsDirectional.only(start: 30.w),
                    decoration: BoxDecoration(
                        color: AppColor.green.withOpacity(.15),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Center(
                        child: Text(
                            "${state is GetTasksSuccessState ? state.taskModelHome.length : 0}",
                            style: Styles.textStyle12.copyWith(
                                color: AppColor.green,
                                fontWeight: FontWeight.w400))),
                  )
                ],
              ),
              SizedBox(height: 31.h),
              if (state is GetTasksSuccessState)
                ListView.separated(
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskWidget(
                          taskModelHome: state.taskModelHome[index]);
                    },
                    separatorBuilder: (BuildContext context, _) {
                      return SizedBox(height: 20.h);
                    },
                    itemCount: state.taskModelHome.length),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }
}
