import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/feature/home/presentation/views/widgets/task_widget.dart';
import 'package:login_task_nti/generated/l10n.dart';

class TasksFile extends StatelessWidget {
  const TasksFile({super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskWidget> tasks = [
      const TaskWidget(),
      const TaskWidget(),
      const TaskWidget(),
      const TaskWidget(),
    ];
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
      child: Column(
        children: [
          SizedBox(height: 54.h),
          Row(
            children: [
              Text(S.of(context).tasks,
                  style: Styles.textStyle14.copyWith(
                      color: AppColor.coolBlack, fontWeight: FontWeight.w300)),
              Container(
                height: 20.h,
                width: 20.w,
                margin: EdgeInsetsDirectional.only(start: 30.w),
                decoration: BoxDecoration(
                    color: AppColor.green.withOpacity(.15),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Center(
                    child: Text("${tasks.length}",
                        style: Styles.textStyle12.copyWith(
                            color: AppColor.green,
                            fontWeight: FontWeight.w400))),
              )
            ],
          ),
          SizedBox(height: 31.h),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext contect, int index) {
                return tasks[index];
              },
              separatorBuilder: (BuildContext context, _) {
                return SizedBox(height: 20.h);
              },
              itemCount: tasks.length),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
