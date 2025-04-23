import 'package:flutter/material.dart';
import 'package:login_task_nti/core/widgets/custom_appbar_widget2.dart';
import 'package:login_task_nti/feature/settings/presentation/views/widgets/setting_body.dart';
import 'package:login_task_nti/generated/l10n.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbarWidget2(appbarTitle:  S.of(context).Settings,),
      body:const SettingBody(),
    );
  }
}
