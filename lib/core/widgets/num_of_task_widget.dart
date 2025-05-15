import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/app_color.dart';

class NumOfTaskWidget extends StatelessWidget {
  const NumOfTaskWidget(
      {super.key,
      this.height = 15,
      this.width = 14,
      this.fontSize = 10,
      required this.taxt});

  final double? height;
  final double? width;
  final double? fontSize;
  final String taxt;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: AppColor.green.withOpacity(.15),
            borderRadius: BorderRadius.circular(5.r)),
        child: Center(
            child: Text(
          taxt,
          style: TextStyle(color: AppColor.green, fontSize: fontSize),
          textAlign: TextAlign.center,
        )));
  }
}
