import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:login_task_nti/core/cache/cache_helper.dart';
import 'package:login_task_nti/core/cache/cache_key.dart';
import 'package:login_task_nti/core/network/dio_consumer.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/constant.dart';
import 'package:login_task_nti/feature/home/data/repo/get_data_repo/get_data_imple.dart';
import 'package:login_task_nti/feature/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:login_task_nti/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const ToDoApp());
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();

  static void setLocale(BuildContext context, Locale locale) {
    _ToDoAppState? state = context.findAncestorStateOfType<_ToDoAppState>();
    state?.setLocale(locale);
  }
}

class _ToDoAppState extends State<ToDoApp> {
   late Locale _locale;

  @override
  void initState() {
    super.initState();
    String? langCode = CacheHelper.getData(key: CacheKey.language);
    _locale = langCode != null ? Locale(langCode) : const Locale('en', 'US');
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
    CacheHelper.saveData(key: CacheKey.language, value: locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocProvider(
        create: (context) =>
            UserCubit(GetDataRepoImple(DioConsumer(dio: Dio()))),
        child: GetMaterialApp(
          locale: Locale("en"),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', 'AE'),
          ],
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
              fontFamily: Constants.fontFamily,
              scaffoldBackgroundColor: AppColor.backgroundColor),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
