import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_image.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';

class AddTaskBody extends StatefulWidget {
  const AddTaskBody({super.key});

  @override
  State<AddTaskBody> createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 36.h),
            CustomImage(height: 207.h, width: 261.w),
            SizedBox(height: 29.h),
            CustomTextField(label: "Title", controller: titleController,validator: ValidatorFormField.validateTitle,),
            SizedBox(height: 17.h),
            CustomTextField(
                label: "Description", controller: descriptionController,validator: ValidatorFormField.validateDescription),
            SizedBox(height: 30.h),
            CustomButton(onPressed: () {}, textButton: "Add Task")
          ],
        ),
      ),
    );
  }
}
