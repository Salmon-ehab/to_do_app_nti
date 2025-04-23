import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/feature/add_task/presentation/views/add_task_view.dart';
import 'package:login_task_nti/feature/changed_password/presentation/views/changed_password_view.dart';
import 'package:login_task_nti/feature/home/presentation/views/home_view.dart';
import 'package:login_task_nti/feature/profile/presentation/views/profile_view.dart';
import 'package:login_task_nti/feature/settings/presentation/views/setting_view.dart';
import 'package:login_task_nti/feature/update_profile/presentation/views/updata_profile_view.dart';

class AppRouter {
  static final GoRouter goRouter = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: Routes.splashView,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen(); //splash
      },
    ),
    GoRoute(
      path: Routes.letStartView,
      builder: (BuildContext context, GoRouterState state) {
        return const LetStartView();
      },
    ),
    GoRoute(
      path: Routes.signInView,
      builder: (BuildContext context, GoRouterState state) {
        return const SigninView();
      },
    ),
    GoRoute(
      path: Routes.logInView,
      builder: (BuildContext context, GoRouterState state) {
        return const LogInView();
      },
    ),
    GoRoute(
      path: Routes.homeView,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: Routes.profileView,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileView();
      },
    ),
    GoRoute(
      path: Routes.updataProfileView,
      builder: (BuildContext context, GoRouterState state) {
        return const UpdataProfileView();
      },
    ),
    GoRoute(
      path: Routes.changedPasswordView,
      builder: (BuildContext context, GoRouterState state) {
        return const ChangedPasswordView();
      },
    ),
    GoRoute(
      path: Routes.addTaskView,
      builder: (BuildContext context, GoRouterState state) {
        return const AddTaskView();
      },
    ),
    GoRoute(
      path: Routes.settingView,
      builder: (BuildContext context, GoRouterState state) {
        return const SettingView();
      },
    ),
  ]);
}
