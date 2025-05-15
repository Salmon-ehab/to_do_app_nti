import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/helper/my_responsive.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.onPressed, required this.textButton});
  final Function() onPressed;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyResponsive.height(context, 48),
      margin:const EdgeInsets.symmetric(horizontal: 23),
      width:double.infinity,
      decoration: BoxDecoration(
        color: AppColor.green,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          textButton,
          style: Styles.textStyle19,
        ),
      ),
    );
  }
}
