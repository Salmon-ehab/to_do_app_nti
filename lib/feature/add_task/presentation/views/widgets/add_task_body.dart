import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/helper/validator/validator_form_field.dart';
import 'package:login_task_nti/core/widgets/custom_button.dart';
import 'package:login_task_nti/core/widgets/custom_text_form_field.dart';
import 'package:login_task_nti/core/widgets/image_manager/widget/image_view.dart';
import 'package:login_task_nti/feature/add_task/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:login_task_nti/feature/add_task/presentation/manager/add_task_cubit/add_task_state.dart';
import 'package:login_task_nti/feature/home/presentation/views/home_view.dart';

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(listener: (context, state) {
      if (state is AddTaskSuccessState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
            MyNavigator.goTo( screen:const HomeView(),isReplace: true);
      } else if (state is AddTaskErrorState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.error)));
      }
    }, builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: AddTaskCubit.get(context).key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 36.h),
                CustomImageView(
                  pickImage: (image) async {
                    AddTaskCubit.get(context).image = image;
                  },
                ),
                SizedBox(height: 29.h),
                CustomTextField(
                  label: "Title",
                  controller: AddTaskCubit.get(context).titleController,
                  validator: ValidatorFormField.validateTitle,
                ),
                SizedBox(height: 17.h),
                CustomTextField(
                    label: "Description",
                    controller: AddTaskCubit.get(context).descriptionController,
                    validator: ValidatorFormField.validateDescription),
                SizedBox(height: 30.h),
                state is AddTaskLoadingState
                    ?const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        onPressed: () {
                          AddTaskCubit.get(context).onAddTaskPressed();
                        },
                        textButton: "Add Task"),
              ],
            ),
          ),
        ),
      );
    });
  }
}
