import 'package:flutter/material.dart';
import 'package:login_task_nti/core/widgets/custom_appbar_widget2.dart';
import 'package:login_task_nti/feature/add_task/presentation/views/widgets/add_task_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarWidget2(appbarTitle: "Add Task"),
      body: AddTaskBody(),
    );
  }
}