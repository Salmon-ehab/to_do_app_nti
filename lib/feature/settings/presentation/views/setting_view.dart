import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/network/dio_consumer.dart';
import 'package:login_task_nti/core/widgets/custom_appbar_widget2.dart';
import 'package:login_task_nti/feature/settings/data/delete_user_repo/delete_user_repo_imple.dart';
import 'package:login_task_nti/feature/settings/presentation/manager/delete_user_cubit/delete_user_cubit.dart';
import 'package:login_task_nti/feature/settings/presentation/views/widgets/setting_body.dart';
import 'package:login_task_nti/generated/l10n.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteUserCubit(
          DeleteUserRepoImple(apiConsumer: DioConsumer(dio: Dio()))),
      child:  Scaffold(
        appBar:CustomAppbarWidget2(appbarTitle:  S.of(context).Settings,),
        body:const SettingBody(),
      ),
    );
  }
}
