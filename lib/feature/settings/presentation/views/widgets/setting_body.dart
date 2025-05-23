import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/feature/auth/presentation/views/log_in_view.dart';
import 'package:login_task_nti/feature/settings/presentation/delete_user_cubit/delete_user_cubit.dart';
import 'package:login_task_nti/feature/settings/presentation/delete_user_cubit/delete_user_state.dart';

import 'language_switch.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  bool isEnglish = true;
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteUserCubit, DeleteUserState>(
      listener: (context, state) async {
        if (state is DeleteUserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        } else if (state is DeleteUserSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User Deleted successfully")),
          );
          MyNavigator.goTo(screen: const LogInView(), isReplace: true);
        }
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 27, end: 33, top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Language", style: Styles.textStyle20),
                LanguageSwitcher(
                    isEnglishSelected: isEnglish, onToggle: _toggleLanguage)
              ],
            ),
            const Spacer(),
            CustomButton(
                textButton: "Delete Account",
                onPressed: DeleteUserCubit.get(context).deleteUser())
          ],
        ),
      ),
    );
  }

  void _toggleLanguage() async {
    // Locale newLocale =
    //     isEnglish ? const Locale('ar', 'AE') : const Locale('en', 'US');
    // await CacheHelper.saveData(
    //     key: CacheKey.language, value: newLocale.languageCode);
    // print(CacheHelper.getData(key: CacheKey.language));
    // ToDoApp.setLocale(context, newLocale); // هذه الطريقة تعيد بناء التطبيق
    setState(() {
      isEnglish = !isEnglish;
      // print(CacheHelper.getData(key: CacheKey.language));
    });
  }
}
