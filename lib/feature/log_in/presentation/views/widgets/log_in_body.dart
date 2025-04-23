import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/core/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_image.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_text_span.dart';
import 'package:login_task_nti/generated/l10n.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            const CustomImage(),
            SizedBox(height: 23.h),
            CustomTextField(
                label: S.of(context).Username,
                controller: nameController,
                prefixIcon: SvgAssets.profileIcon,
                validator: ValidatorFormField.validateName),
            SizedBox(height: 10.h),
            CustomTextField(
                label: S.of(context).Password,
                controller: passwordController,
                prefixIcon: SvgAssets.passwordIcon,
                isPassword: true,
                validator: ValidatorFormField.validatePassword),
            SizedBox(height: 23.h),
            CustomButton(
                onPressed: () {
                  if (!keyForm.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please try again!")));
                  } else {
                    GoRouter.of(context).pushReplacement(Routes.homeView);
                  }
                },
                textButton: S.of(context).login),
            SizedBox(height: 41.h),
             Material(
                color: Colors.transparent,
                child: CustomTextSpan(
                    text1: S.of(context).q2,
                    text2: S.of(context).Register,
                    routePage:const SigninView())),
          ],
        ),
      ),
    );
  }
}
