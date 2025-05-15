import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/png.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {super.key, this.height = 298, this.width = double.infinity, this.isBorderNeeded =true});
  final double? height;
  final double? width;
  final bool? isBorderNeeded;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:isBorderNeeded != false? BorderRadius.only(
          topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)) :BorderRadius.zero,
      child: Image.asset(
        PngAssets.loginViewImage,
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }
}
