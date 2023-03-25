import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/core/repositories/task_repository.dart';
import 'package:gtd_app/data/datasources/task_remote_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Task>> getTaskList() async {
    return await remoteDataSource.getTaskList();
  }

  @override
  Future<Task> updateTask(Task task) async {
    return await remoteDataSource.updateTask(task);
  }

  @override
  Future<Task> createTask(Task task) async {
    return await remoteDataSource.createTask(task);
  }

  @override
  Future<bool> disableTask(Task task) async {
    return await remoteDataSource.disableTask(task);
  }
}
