import 'package:flutter/foundation.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/core/repositories/task_repository.dart';

class TaskProvider with ChangeNotifier {
  final TaskRepository repository;

  TaskProvider({required this.repository});

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _tasks = await repository.getTaskList();
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    final updatedTask = await repository.updateTask(task);
    final index = _tasks.indexWhere((t) => t.id == updatedTask.id);
    _tasks[index] = updatedTask;
    notifyListeners();
  }

  Future<void> createTask(Task task) async {
    try {
      final newTask = await repository.createTask(task);
      _tasks.add(newTask);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to create task');
    }
  }

  Future<void> disableTask(Task task) async {
    await repository.disableTask(task);
    notifyListeners();
  }
}
