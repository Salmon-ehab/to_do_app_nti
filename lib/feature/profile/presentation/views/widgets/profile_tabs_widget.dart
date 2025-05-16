import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/utils/svg.dart';

class ProfileTabsWidget extends StatelessWidget {
  const ProfileTabsWidget(
      {super.key, required this.prefixIcon, required this.textTab, required this.routes});
  final String prefixIcon;
  final String textTab;
  final Widget routes;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.h,
      width: 331.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.only(bottom: 25.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColor.whiteColor),
      child: Row(
        children: [
          SvgPicture.asset(
            prefixIcon,
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(width: 16.w),
          Text(textTab,
              style: Styles.textStyle16.copyWith(
                  color: AppColor.coolBlack, fontWeight: FontWeight.w400)),
          const Spacer(),
          InkWell(
            onTap: () =>
                   MyNavigator.goto(context,screen:()=> routes )
                  ,
            child:Transform.rotate(
              angle: Intl.getCurrentLocale().startsWith('ar') ? 3.14 : 0,
              child: SvgPicture.asset(
                SvgAssets.arrowIcon,
                height: 21.h,
                width: 21.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
