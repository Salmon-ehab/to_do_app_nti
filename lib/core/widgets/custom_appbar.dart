import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_task_nti/core/helper/my_navigator.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/core/utils/app_color.dart';
import 'package:login_task_nti/core/utils/png.dart';
import 'package:login_task_nti/core/utils/styles.dart';
import 'package:login_task_nti/core/utils/svg.dart';
import 'package:login_task_nti/feature/add_task/presentation/views/add_task_view.dart';
import 'package:login_task_nti/feature/home/presentation/manager/user_cubit/user_cubit.dart';
import 'package:login_task_nti/feature/home/presentation/manager/user_cubit/user_state.dart';
import 'package:login_task_nti/feature/profile/presentation/views/profile_view.dart';
import 'package:login_task_nti/generated/l10n.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, this.isNeededIcon = true});
  final bool? isNeededIcon;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(listener: (context, state) {
      if (state is UserErrorState) {
        MyNavigator.getOff(context,
            screen: () => const LogInView(), isReplace: true);
      }
    }, builder: (context, state) {
      return SizedBox(
        height: 50,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              InkWell(
                onTap: () => MyNavigator.goto(
                  context,
                  screen: () => const ProfileView(),
                ),
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundImage: state is UserSuccessState  && state.userModel.image!=null
                      ? NetworkImage(state.userModel.image!)
                      : const AssetImage(PngAssets.loginViewImage),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).hello,
                      style: Styles.textStyle12,
                    ),
                    SizedBox(height: 4.h),
                    if (state is UserSuccessState)
                      Text(
                        state.userModel.name ?? "No name",
                        style: Styles.textStyle16.copyWith(
                            color: AppColor.coolBlack,
                            fontWeight: FontWeight.w300),
                      ),
                    const Spacer(),
                  ],
                ),
              ),
              const Spacer(),
              isNeededIcon == true
                  ? IconButton(
                      onPressed: () {
                        MyNavigator.goto(context,
                            screen: () => const AddTaskView());
                      },
                      icon: SvgPicture.asset(
                        SvgAssets.plusIcon,
                        height: 24.h,
                        width: 24.w,
                      ))
                  : const SizedBox.shrink()
            ],
          ),
        ),
      );
    });
  }
}
