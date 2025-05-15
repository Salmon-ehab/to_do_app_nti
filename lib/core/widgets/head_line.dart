import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/widgets/num_of_task_widget.dart';

class HeadLine extends StatelessWidget {
  const HeadLine(
      {super.key, required this.textHeadLine, this.isNeeded = false,  this.numOfTasks});
  final String textHeadLine;
  final bool? isNeeded;
  final int? numOfTasks;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20.h),
      child: Row(
        children: [
          Text(
            textHeadLine,
            style: Styles.text14Weight300.copyWith(color: AppColor.coolBlack),
          ),
          SizedBox(
            width: 20.w,
          ),
          isNeeded != false
              ?  NumOfTaskWidget(taxt: "$numOfTasks")
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
