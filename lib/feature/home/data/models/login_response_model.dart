import 'package:login_task_nti/feature/home/data/models/user_model.dart';

class LoginResponseModel {
  String? accessToken;
  String? refreshToken;
  bool? status;
  UserModel? user;

  LoginResponseModel(
      {this.accessToken, this.refreshToken, this.status, this.user});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      status: json['status'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'status': status,
      'user': UserModel
    };
  }
}
