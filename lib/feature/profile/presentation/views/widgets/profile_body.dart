import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/core/widgets/custom_appbar.dart';
import 'package:login_task_nti/feature/changed_password/presentation/views/changed_password_view.dart';
import 'package:login_task_nti/feature/profile/presentation/views/widgets/profile_tabs_widget.dart';
import 'package:login_task_nti/feature/settings/presentation/views/setting_view.dart';
import 'package:login_task_nti/feature/update_profile/presentation/views/updata_profile_view.dart';
import 'package:login_task_nti/generated/l10n.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            const CustomAppbar(
              isNeededIcon: false,
            ),
            SizedBox(height: 37.h),
            ProfileTabsWidget(
                prefixIcon: SvgAssets.profileIcon,
                textTab: S.of(context).updateprofile,
                routes: const UpdataProfileView()),
            ProfileTabsWidget(
                prefixIcon: SvgAssets.lockIcon,
                textTab: S.of(context).ChangePassword,
                routes: const ChangedPasswordView()),
            ProfileTabsWidget(
                prefixIcon: SvgAssets.settingIcon,
                textTab: S.of(context).Settings,
                routes: const SettingView()),
         
          ]),
    );
  }
}
