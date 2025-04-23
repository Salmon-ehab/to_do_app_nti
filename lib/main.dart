import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/routes/app_router.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/constant.dart';
import 'package:login_task_nti/generated/l10n.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();

  static void setLocale(BuildContext context, Locale locale) {
    _LoginAppState? state = context.findAncestorStateOfType<_LoginAppState>();
    state?.setLocale(locale);
  }
}

class _LoginAppState extends State<LoginApp> {
  Locale _locale = const Locale('en', 'US');
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp.router(
        locale: _locale,
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
        routerConfig: AppRouter.goRouter,
      ),
    );
  }
}
