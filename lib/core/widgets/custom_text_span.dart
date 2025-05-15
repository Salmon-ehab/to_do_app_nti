import 'package:flutter/material.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/utils/styles.dart';

class CustomTextSpan extends StatelessWidget {
  const CustomTextSpan(
      {super.key,
      required this.text1,
      required this.text2,
      required this.routePage});
  final String text1;
  final String text2;
  final Widget routePage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text1,
          style: Styles.textStyle14.copyWith(color: Colors.black),
        ),
        InkWell(
          onTap: () {
            MyNavigator.goto(context, screen: routePage);
          },
          child: Text(
            " \t\t\t$text2",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
