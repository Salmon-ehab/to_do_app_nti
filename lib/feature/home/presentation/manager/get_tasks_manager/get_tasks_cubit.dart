import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/feature/home/data/repo/get_tasks_repo/get_task_repo_imple.dart';
import 'package:login_task_nti/feature/home/presentation/manager/get_tasks_manager/get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit(this.getTaskRepoImple) : super(GetTasksInitialState());
  final GetTaskRepoImple getTaskRepoImple;
  static GetTasksCubit get(context) => BlocProvider.of(context);

   getTasksFromAPI() async {
    var response = await getTaskRepoImple.getTask();
    // print("tasks5555555555555555: $response");

    response.fold((error) {
      // print("Error in getUserDataFromAPI: $error");

      emit(GetTasksFailure(error: error.toString()));
    }, (taskModel) {
      // print("👤 getTasks response: $taskModel");

      emit(GetTasksSuccessState(taskModelHome: taskModel));
    });
  }
}
