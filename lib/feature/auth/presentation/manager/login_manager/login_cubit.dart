import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/core/routes/routes.export.dart';
import 'package:login_task_nti/feature/auth/data/repo/repo_login/repo_login_implementaiton.dart';
import 'package:login_task_nti/feature/auth/presentation/manager/login_manager/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repoLoginImplementaiton) : super(LoginInitialState());
  final RepoLoginImplementaiton repoLoginImplementaiton;
  String? error;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  static LoginCubit get(context) => BlocProvider.of(context);

  void onLoginPressed() async {
    error = null;
    if (!keyForm.currentState!.validate()) {
      error = 'Complete the form and fix errors';
      emit(LoginErrorState(error: error!));
      return;
    }
   
    emit(LoginLoadingState());

    final result = await repoLoginImplementaiton.loginWithEmailAndPassword(
        name: nameController.text, password: passwordController.text);

    result.fold((error) {
      emit(LoginErrorState(error: error.message));
    }, (loginResponse) {
      emit(LoginSuccessState(loginResponseModel: loginResponse));
    });
  }
}
