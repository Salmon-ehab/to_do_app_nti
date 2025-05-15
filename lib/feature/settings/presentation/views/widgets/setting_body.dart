import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/cache/cache_helper.dart';
import 'package:login_task_nti/core/cache/cache_key.dart';
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
void _toggleLanguage() async {
  Locale newLocale = isEnglish ? const Locale('ar', 'AE') : const Locale('en', 'US');
  await CacheHelper.saveData(key: CacheKey.language, value: newLocale.languageCode);
  print(CacheHelper.getData(key: CacheKey.language));
  ToDoApp.setLocale(context, newLocale); // هذه الطريقة تعيد بناء التطبيق
  setState(() {
    isEnglish = !isEnglish;
      print(CacheHelper.getData(key: CacheKey.language));

  });
}}
