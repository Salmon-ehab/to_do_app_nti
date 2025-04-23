import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/utils/svg.dart';

class CustomAppbarWidget2 extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarWidget2({super.key, required this.appbarTitle});
  final String appbarTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Transform.rotate(
        angle:Intl.getCurrentLocale().startsWith('en')? 3.1416:0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            SvgAssets.arrowIcon,
            height: 21.h,
            width: 21.w,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColor.backgroundColor,
      title: Text(
        appbarTitle,
        style: Styles.textStyle19.copyWith(color: AppColor.coolBlack),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
