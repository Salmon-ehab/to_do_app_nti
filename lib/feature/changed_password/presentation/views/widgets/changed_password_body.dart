import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/helper/validator/validator_form_field.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_image.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/feature/auth/presentation/views/log_in_view.dart';
import 'package:login_task_nti/feature/changed_password/presentation/manager/change_password_cubit.dart/change_password_state.dart';
import 'package:login_task_nti/feature/changed_password/presentation/manager/change_password_cubit.dart/change_paswword_cubit.dart';
import 'package:login_task_nti/generated/l10n.dart';

class ChangedPasswordBody extends StatelessWidget {
  const ChangedPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocConsumer<ChangePaswwordCubit,ChangePasswordState>(builder: (context, state) {
      return Form(
        key: ChangePaswwordCubit.get(context).key,
        child: Column(
          children: [
            const CustomImage(),
            SizedBox(height: 23.h),
            CustomTextField(
                label: S.of(context).OldPassword,
                controller:
                    ChangePaswwordCubit.get(context).oldPasswordController,
                validator: ValidatorFormField.validatePassword),
            SizedBox(height: 10.h),
            CustomTextField(
                label: S.of(context).NewPassword,
                controller:
                    ChangePaswwordCubit.get(context).newPasswordController,
                validator: ValidatorFormField.validatePassword),
            SizedBox(height: 10.h),
            CustomTextField(
                label: S.of(context).ConfirmPassword,
                controller:
                    ChangePaswwordCubit.get(context).confirmPasswordController,
                validator: ValidatorFormField.validateConfirmPassword),
            SizedBox(height: 23.h),
            state is ChangePasswordLoadingState
                ? const CircularProgressIndicator()
                : CustomButton(
                    onPressed: ChangePaswwordCubit.get(context)
                        .onPressedChangePasswordButton,
                    textButton: S.of(context).Save)
          ],
        ),
      );
    }, listener: (context, state) {
      if (state is ChangePasswordSuccessState) {
        MyNavigator.goTo(screen: const LogInView(), isReplace: true);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Password Change Successfully!',
          style: TextStyle(color: AppColor.green),
        )));
      }
      if (state is ChangePasswordFailureState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          state.error,
          style: const TextStyle(color: Colors.red),
        )));
      }
    }));
  }
}
