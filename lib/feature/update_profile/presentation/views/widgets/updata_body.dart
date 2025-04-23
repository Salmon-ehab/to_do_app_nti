import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_image.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/generated/l10n.dart';

class UpdataBody extends StatefulWidget {
  const UpdataBody({super.key});

  @override
  State<UpdataBody> createState() => _UpdataBodyState();
}

class _UpdataBodyState extends State<UpdataBody> {
  late TextEditingController nameController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomImage(),
        SizedBox(height: 23.h),
        CustomTextField(label: S.of(context).Username, controller: nameController,validator: ValidatorFormField.validateName,),
        SizedBox(height: 27.h),
        CustomButton(onPressed: () {}, textButton: S.of(context).Update)
      ],
    );
  }
}
