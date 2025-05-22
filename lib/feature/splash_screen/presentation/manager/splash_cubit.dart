import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/cache/cache_helper.dart';
import 'package:login_task_nti/core/cache/cache_key.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';

import '../../../../core/cache/cache_data.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit() : super(null);

  static SplashCubit get(context) => BlocProvider.of(context);
  void startTimer(context) async {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    await Future.delayed(const Duration(seconds: 3), () {
      //  if (context.mounted) {
      CacheData.firstTime = CacheHelper.getData(key: CacheKey.firstTime);
      if (CacheData.firstTime != null) {
        MyNavigator.goTo( screen: () =>const LogInView(), isReplace: true);
      } else {
        MyNavigator.goTo(
            screen: () =>const LetStartView(), isReplace: true);
      }
      //    }
    });
  }
}
