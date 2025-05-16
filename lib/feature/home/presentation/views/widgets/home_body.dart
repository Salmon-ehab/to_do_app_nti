import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task_nti/core/widgets/custom_appbar.dart';
import 'package:login_task_nti/feature/home/presentation/views/widgets/tasks_file.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
           const CustomAppbar(),
            // isClicked ? 
            const TasksFile() ,
            // : const EmptyTaskWidget(),
            SizedBox(height: 40.h),
            // Switch(
            //     value: isClicked,
            //     activeColor: AppColor.green,
            //     onChanged: (value) {
            //       setState(() {
            //         isClicked = !isClicked;
            //       });
            //     })
          ],
        ),
      ),
    );
  }
}
