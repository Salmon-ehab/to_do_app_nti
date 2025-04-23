import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/png.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key, this.height = 298, this.width = double.infinity});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
      child: Image.asset(
        PngAssets.loginViewImage,
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }
}
