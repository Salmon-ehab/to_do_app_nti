import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_text_span.dart';
import 'package:login_task_nti/feature/sign_in/presentation/views/widgets/sign_in_tetx_fiels.dart';
import 'package:login_task_nti/generated/l10n.dart';


class SigninBody extends StatefulWidget {
  const SigninBody({super.key});

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            SigninTetxFields(
              nameController: nameController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
            ),
            CustomButton(
                onPressed: () {
                  if (!keyForm.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please try again!")));
                  } else {
                    GoRouter.of(context).pushReplacement(Routes.homeView);
                  }
                },
                textButton: S.of(context).Register),
            SizedBox(height: 40.h),
             Material(
                color: Colors.transparent,
                child: CustomTextSpan(
                    text1:  S.of(context).q1,
                    text2: S.of(context).login,
                    routePage:const LogInView())),
          ],
        ),
      ),
    );
  }
}
