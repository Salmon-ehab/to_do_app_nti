import 'package:login_task_nti/feature/home/data/models/task_model_home.dart';

abstract class GetTasksState {}

class GetTasksInitialState extends GetTasksState{}

class GetTasksLoadingState extends GetTasksState{}

class GetTasksSuccessState extends GetTasksState{
   List<TaskModelHome> taskModelHome;

  GetTasksSuccessState({required this.taskModelHome});
}

class GetTasksFailure extends GetTasksState{
    String error;
  GetTasksFailure({required this.error});
}