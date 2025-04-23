import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';

class LanguageSwitcher extends StatelessWidget {
  final bool isEnglishSelected;
  final VoidCallback onToggle;

  const LanguageSwitcher({
    super.key,
    required this.isEnglishSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle, 
      child: Container(
        height: 36.h,
        width: 102.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColor.coolGray,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isEnglishSelected ? AppColor.coolGray : AppColor.green,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(isEnglishSelected ? 5.r : 0), 
                    right: Radius.circular(isEnglishSelected ? 0 : 5.r),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'AR',
                  style: Styles.textStyle20.copyWith(
                    color: isEnglishSelected
                        ? AppColor.blackColor
                        : AppColor.whiteColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isEnglishSelected ? AppColor.green : AppColor.coolGray,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(isEnglishSelected ? 0 : 5.r),
                    right: Radius.circular(isEnglishSelected ? 5.r : 0),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'EN',
                  style: Styles.textStyle20.copyWith(
                    color: isEnglishSelected
                        ? AppColor.whiteColor
                        : AppColor.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
