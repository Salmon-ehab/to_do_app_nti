import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/png.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
          PngAssets.loginViewImage,
          width: MediaQuery.sizeOf(context).height,
          height: 298.h,
          fit: BoxFit.fill,
        );
  }
}