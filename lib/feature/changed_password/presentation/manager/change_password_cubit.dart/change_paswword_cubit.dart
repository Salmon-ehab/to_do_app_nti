import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePaswwordCubit extends Cubit<void> {
  ChangePaswwordCubit() : super(null);

  static ChangePaswwordCubit get(context) => BlocProvider.of(context);
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> key =GlobalKey<FormState>();
}
