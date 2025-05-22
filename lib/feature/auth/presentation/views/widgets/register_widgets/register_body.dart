import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/network/dio_consumer.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_text_span.dart';
import 'package:login_task_nti/feature/auth/data/repo/repo_register/repo_register_imple.dart';
import 'package:login_task_nti/feature/auth/presentation/manager/register_manager/register_cubit.dart';
import 'package:login_task_nti/feature/auth/presentation/manager/register_manager/register_state.dart';
import 'package:login_task_nti/feature/auth/presentation/views/widgets/register_widgets/register_tetx_fiels.dart';
import 'package:login_task_nti/generated/l10n.dart';

class SigninBody extends StatelessWidget {
  const SigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(
          RepoRegisterImple(apiConsumer: DioConsumer(dio: Dio()))),
      child: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Form(
            key: RegisterCubit.get(context).keyForm,
            child: Column(
              children: [
                SigninTetxFields(
                  nameController: RegisterCubit.get(context).nameController,
                  passwordController:
                      RegisterCubit.get(context).passwordController,
                  confirmPasswordController:
                      RegisterCubit.get(context).confirmPasswordController,
                  pickImage: (image) {
                  RegisterCubit.get(context).image =image;
                  },
                ),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccessState) {
                      MyNavigator.goTo(
                          screen: const LogInView(), isReplace: true);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'Register Success',
                        style: TextStyle(color: AppColor.green),
                      )));
                    }
                    if (state is RegisterFailureState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        state.error,
                        style: const TextStyle(color: Colors.red),
                      )));
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                        onPressed:
                            RegisterCubit.get(context).onPressedRegisterButton,
                        textButton: S.of(context).Register);
                  },
                ),
                const SizedBox(height: 40),
                Material(
                    color: Colors.transparent,
                    child: CustomTextSpan(
                        text1: S.of(context).q1,
                        text2: S.of(context).login,
                        routePage: const LogInView())),
              ],
            ),
          ),
        );
      }),
    );
  }
}
