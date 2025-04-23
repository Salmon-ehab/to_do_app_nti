import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/feature/settings/presentation/views/widgets/language_switch.dart';
import 'package:login_task_nti/generated/l10n.dart';
import 'package:login_task_nti/main.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  bool isEnglish = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 72.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).Language, style: Styles.textStyle20),
                LanguageSwitcher(
                    isEnglishSelected: isEnglish,
                    onToggle:_toggleLanguage
                     )
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _toggleLanguage() {
  Locale newLocale = isEnglish ?const Locale('ar', 'AE') :const Locale('en', 'US');
  LoginApp.setLocale(context, newLocale);
  setState(() {
      isEnglish = !isEnglish;
    });

}}
