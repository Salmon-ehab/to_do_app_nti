import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_task_nti/core/helper/my_responsive.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/feature/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:login_task_nti/feature/home/presentation/views/home_view.dart';
import '../../../../../../core/cache/cache_data.dart';
import '../../../../../../core/cache/cache_helper.dart';
import '../../../../../../core/cache/cache_key.dart';
import '../../../../../../core/helper/my_navigator.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      //  if (context.mounted) {
      // CacheData.firstTime = CacheHelper.getData(key: CacheKey.firstTime);
      // if (CacheData.firstTime != null) {
      //   MyNavigator.getOff(context, screen: const LogInView(), isReplace: true);
      // } else {
      //   MyNavigator.getOff(context,
      //       screen: const LetStartView(), isReplace: true);
      // }
      //    }
      CacheData.firstTime = CacheHelper.getData(key: CacheKey.firstTime);
      if (CacheData.firstTime != null) {
        // check is logged in
        CacheData.accessToken = CacheHelper.getData(key: CacheKey.accessToken);
        if (CacheData.accessToken != null) {
          UserCubit.get(context).getUserDataFromAPI();
          MyNavigator.getOff(context,
              screen: () => HomeView(), isReplace: true);
        } else {
          // goto login
          MyNavigator.getOff(context,
              screen: () => LogInView(), isReplace: true);
        }
      } else // first time
      {
        MyNavigator.getOff(context,
            screen: () =>const LetStartView(), isReplace: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (context.mounted) {
    // SplashCubit.get(context).startTimer(context);
    // }
    // });
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MyResponsive.width(context, 20)),
            child: AspectRatio(
              aspectRatio: 1.03,
              child: SvgPicture.asset(
                SvgAssets.splashIcon,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: MyResponsive.height(context, 44)),
          Text(
            "TODO",
            style: Styles.textStyle36,
          )
        ],
      ),
    );
  }
}
