import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_task_nti/core/cache/cache_helper.dart';
import 'package:login_task_nti/core/cache/cache_key.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/helper/my_responsive.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/generated/l10n.dart';

class LetStartBody extends StatelessWidget {
  const LetStartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.w),
          child: AspectRatio(
            aspectRatio: 1.13,
            child: SvgPicture.asset(
              SvgAssets.letStartLogo,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: MyResponsive.height(context, 60)),
        SizedBox(
          width: MyResponsive.width(context, 147),
          child: Text(S.of(context).welcomeText1,
              style: Styles.textStyle24, textAlign: TextAlign.center),
        ),
        SizedBox(height: 40.h),
        SizedBox(
          width: MyResponsive.width(context, 314),
          child: Text(S.of(context).welcomeText2,
              style: Styles.textStyle16, textAlign: TextAlign.center),
        ),
        SizedBox(height: MyResponsive.height(context, 55)),
        CustomButton(
            onPressed: () {
              CacheHelper.saveData(key: CacheKey.firstTime,value: false);
              MyNavigator.goTo( screen: const SigninView(),isReplace: true);
            },
            textButton: S.of(context).LetButton),
      ],
    );
  }
}
