import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/feature/home/data/models/task_model_home.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.taskModelHome});
  final TaskModelHome taskModelHome;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 335.w,
      padding: EdgeInsetsDirectional.all(13.h),
      decoration: BoxDecoration(
          color: AppColor.skyColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withOpacity(.25),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskModelHome.title ?? "No Name",
                style: Styles.textStyle12.copyWith(
                    color: AppColor.grey, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                  width: 180.w,
                  child: Text(
                    taskModelHome.description ?? "No Desc",
                    style: Styles.textStyle14.copyWith(
                        color: AppColor.coolBlack, fontWeight: FontWeight.w300),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
          Column(
            children: [
              // Text(
              //   taskModelHome.createdAt??"No Date",
              //   style: Styles.textStyle12
              //       .copyWith(color: AppColor.grey, fontWeight: FontWeight.w400),
              // ),
              Text(
                formatTextWithLineBreaks(
                    taskModelHome.createdAt ?? "No Date", 3),
                style: Styles.textStyle12.copyWith(
                    color: AppColor.grey, fontWeight: FontWeight.w400),
              )

              // CircleAvatar(
              //   radius: 10,
              //   child: Image.file(File(taskModelHome.imagePath!)),
              // )
            ],
          ),
        ],
      ),
    );
  }
}

String formatTextWithLineBreaks(String text, int wordsPerLine) {
  List<String> words = text.split(' ');
  List<String> lines = [];

  for (int i = 0; i < words.length; i += wordsPerLine) {
    int end =
        (i + wordsPerLine < words.length) ? i + wordsPerLine : words.length;
    lines.add(words.sublist(i, end).join(' '));
  }

  return lines.join('\n');
}
