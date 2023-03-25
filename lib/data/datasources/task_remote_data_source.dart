import 'dart:convert';

import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/data/datasources/api_client.dart';

class TaskRemoteDataSource {
  final taskList = <Task>[];
  final apiClient = ApiClient();
  // final ApiClient apiClient;

  TaskRemoteDataSource();

  Future<Task> updateTask(Task task) async {
    final String updateTaskUrl = 'task/update/${task.id}/';
    final body = jsonEncode(task.toJson());
    final response = await apiClient.patch(updateTaskUrl, body);
    final updatedTask = Task.fromJson(response as Map<String, dynamic>);
    return updatedTask;
  }

  Future<List<Task>> getTaskList() async {
    const String getTaskListUrl = 'task/';
    final apiResponse = await apiClient.get(getTaskListUrl);
    final data = apiResponse;
    taskList.clear();
    for (final json in data) {
      taskList.add(Task.fromJson(json as Map<String, dynamic>));
    }
    return taskList;
  }

  Future<Task> createTask(Task task) async {
    const String updateTaskUrl = 'task/create/';
    final body = jsonEncode(task.toJson());
    final response = await apiClient.post(updateTaskUrl, body);
    final updatedTask = Task.fromJson(response as Map<String, dynamic>);
    return updatedTask;
  }

  Future<bool> disableTask(Task task) async {
    final String updateTaskUrl = 'task/disable/${task.id}/';
    final body = jsonEncode(task.toJson());
    await apiClient.patch(updateTaskUrl, body);
    return true;
  }
}
