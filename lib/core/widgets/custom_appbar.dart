import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/png.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/generated/l10n.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, this.isNeededIcon = true});
  final bool? isNeededIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          InkWell(
            onTap: ()=> GoRouter.of(context).push(Routes.profileView),
            child: CircleAvatar(
              radius: 30.r,
              backgroundImage: const AssetImage(PngAssets.loginViewImage),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).hello,
                  style: Styles.textStyle12,
                ),
                SizedBox(height: 4.h),
                Text(
                  S.of(context).AhmedSaber,
                  style: Styles.textStyle16.copyWith(
                      color: AppColor.coolBlack, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          const Spacer(),
          isNeededIcon == true
              ? IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(Routes.addTaskView);
                  },
                  icon: SvgPicture.asset(
                    SvgAssets.plusIcon,
                    height: 24.h,
                    width: 24.w,
                  ))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
