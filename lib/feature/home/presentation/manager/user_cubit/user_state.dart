import 'package:login_task_nti/feature/home/data/models/user_model.dart';

abstract class UserState {}

class UserInitState extends UserState{}

class UserSuccessState extends UserState{
  UserModel userModel;

  UserSuccessState({required this.userModel});
}

class UserErrorState extends UserState{
    String error;
  UserErrorState({required this.error});
}