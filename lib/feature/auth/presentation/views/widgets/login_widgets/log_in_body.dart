import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/network/dio_consumer.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/core/helper/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_image.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_text_span.dart';
import 'package:login_task_nti/feature/auth/data/repo/repo_login/repo_login_implementaiton.dart';
import 'package:login_task_nti/feature/auth/presentation/manager/login_manager/login_cubit.dart';
import 'package:login_task_nti/feature/auth/presentation/manager/login_manager/login_state.dart';
import 'package:login_task_nti/feature/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:login_task_nti/generated/l10n.dart';

import '../../../../../home/presentation/views/home_view.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
          create: (BuildContext context) => LoginCubit(
              RepoLoginImplementaiton(apiConsumer: DioConsumer(dio: Dio()))),
          child: Builder(builder: (context) {
            return Form(
              key: LoginCubit.get(context).keyForm,
              child: Column(
                children: [
                  const CustomImage(isBorderNeeded: false),
                  const SizedBox(height: 23),
                  CustomTextField(
                      label: S.of(context).Username,
                      controller: LoginCubit.get(context).nameController,
                      prefixIcon: SvgAssets.profileIcon,
                      validator: ValidatorFormField.validateName),
                  const SizedBox(height: 10),
                  CustomTextField(
                      label: S.of(context).Password,
                      controller: LoginCubit.get(context).passwordController,
                      prefixIcon: SvgAssets.passwordIcon,
                      isPassword: true,
                      validator: ValidatorFormField.validatePassword),
                  const SizedBox(height: 23),
                  BlocListener<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          UserCubit.get(context).getUserData(
                              user: state.loginResponseModel.user!);
                          MyNavigator.goTo(
                              screen: () => const HomeView(), isReplace: true);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Success')));
                        }
                        if (state is LoginErrorState) {
                          // print(state.error);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            state.error,
                            style: const TextStyle(color: Colors.red),
                          )));
                        }
                      },
                      child: CustomButton(
                          onPressed: LoginCubit.get(context).onLoginPressed,
                          textButton: S.of(context).login)),
                  const SizedBox(height: 41),
                  Material(
                      color: Colors.transparent,
                      child: CustomTextSpan(
                          text1: S.of(context).q2,
                          text2: S.of(context).Register,
                          routePage: const SigninView())),
                ],
              ),
            );
          })),
    );
  }
}
