import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/generated/l10n.dart';

class LetStartBody extends StatelessWidget {
  const LetStartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(SvgAssets.letStartLogo,
              height: 342.h, width: 301.w, fit: BoxFit.fill),
          SizedBox(height: 60.h),
          SizedBox(
            width: 147.w,
            child: Text(S.of(context).welcomeText1,
                style: Styles.textStyle24, textAlign: TextAlign.center),
          ),
          SizedBox(height: 40.h),
          SizedBox(
            width: 314.w,
            child: Text(S.of(context).welcomeText2,
                style: Styles.textStyle16, textAlign: TextAlign.center),
          ),
          SizedBox(height: 55.h),
          CustomButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(Routes.signInView);
              },
              textButton: S.of(context).LetButton),
        ],
      ),
    );
  }
}
