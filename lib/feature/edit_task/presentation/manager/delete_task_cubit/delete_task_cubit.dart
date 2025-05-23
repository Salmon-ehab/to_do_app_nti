import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task_nti/feature/edit_task/data/delete_task_repo/delete_task_repo_imple.dart';
import 'package:login_task_nti/feature/edit_task/presentation/manager/delete_task_cubit/delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  final DeleteTaskRepoImple deleteTaskRepoImple;

  DeleteTaskCubit({
    required this.deleteTaskRepoImple,
  }) : super(DeleteTaskInitialState());
  static DeleteTaskCubit get(context) => BlocProvider.of(context);

  deleteTask({required int taskId}) async {
  
    emit(DeleteTaskTaskLoadingState());
    var result = await deleteTaskRepoImple.deleteTask(id: taskId);
    result.fold((error) {
      emit(DeleteTaskFailureState(error: error.toString()));
      // print("error salma:$error");
    }, (response) {
      emit(DeleteTaskSuccessState(responseModel: response));
      // print("success:$response");
    });
  }
}
