import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

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
                "My First Task",
                style: Styles.textStyle12.copyWith(
                    color: AppColor.grey, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                  width: 180.w,
                  child: Text(
                    "Improve my English skills by trying to speek",
                    style: Styles.textStyle14.copyWith(
                        color: AppColor.coolBlack, fontWeight: FontWeight.w300),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
          Text(
            "11/03/2025\n\t\t05:00 PM",
            style: Styles.textStyle12
                .copyWith(color: AppColor.grey, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
