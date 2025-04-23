import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/generated/l10n.dart';

class EmptyTaskWidget extends StatelessWidget {
  const EmptyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 79.h),
        SizedBox(
          width: 210.w,
          child: Text(
            S.of(context).noTasks,
            style: Styles.textStyle16
                .copyWith(color: AppColor.coolBlack, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 63.h),
        SvgPicture.asset(SvgAssets.homeLogo,
            height: 206.h, width: 295.w, fit: BoxFit.cover),
        SizedBox(height: 79.h),
      ],
    );
  }
}
