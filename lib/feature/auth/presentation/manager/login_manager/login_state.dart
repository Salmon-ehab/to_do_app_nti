import 'package:login_task_nti/feature/home/data/models/login_response_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginResponseModel loginResponseModel;

  LoginSuccessState({required this.loginResponseModel});
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState({required this.error});
}
