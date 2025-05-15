import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/feature/home/data/models/user_model.dart';
import 'package:login_task_nti/feature/home/data/repo/get_data_imple.dart';
import 'package:login_task_nti/feature/home/presentation/manager/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.getDataImple) : super(UserInitState());
  final GetDataRepoImple getDataImple;
  static UserCubit get(context) => BlocProvider.of(context);

  void getUserData({required UserModel user}) {
    emit(UserSuccessState(userModel: user));
  }

  void getUserDataFromAPI() async {
    var response = await getDataImple.getData();
    print("👤 getUserData response: $response");

    response.fold((error) {
      print("Error in getUserDataFromAPI: $error");

      emit(UserErrorState(error: error.toString()));
    }, (userModel) {
      emit(UserSuccessState(userModel: userModel));
    });
  }
}
