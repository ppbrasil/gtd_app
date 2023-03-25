import 'package:gtd_app/core/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTaskList();
  Future<Task> updateTask(Task task);
  Future<Task> createTask(Task task);
  Future<bool> disableTask(Task task);
}
