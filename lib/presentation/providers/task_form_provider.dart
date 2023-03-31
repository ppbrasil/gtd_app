import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/presentation/providers/task_provider.dart';

class TaskFormProvider extends ChangeNotifier {
  final TaskProvider _taskProvider;
  String? _title;
  bool _isDone = false;
  bool _isFocus = false;
  int? _id;

  TaskFormProvider({required TaskProvider taskProvider, Task? task})
      : _taskProvider = taskProvider {
    task ??= Task(title: '', id: null, isDone: false, isFocus: false);
    _title = task.title;
    _isDone = task.isDone;
    _isFocus = task.isFocus;
    _id = task.id;
  }

  String? get title => _title;
  bool get isDone => _isDone;
  bool get isFocus => _isFocus;
  int? get id => _id;

  Future<void> updateTitle(String newTitle, Task task) async {
    _title = newTitle;
    if (task.id != null) {
      await _taskProvider.updateTask(task.copyWith(title: newTitle));
    }
    notifyListeners();
  }

  void updateIsDone(bool newIsDone, Task task) {
    _isDone = newIsDone;
    if (task.id != null) {
      _taskProvider.updateTask(task.copyWith(isDone: newIsDone));
    }
    notifyListeners();
  }

  void updateIsFocus(bool newIsFocus, Task task) {
    _isFocus = newIsFocus;
    if (task.id != null) {
      _taskProvider.updateTask(task.copyWith(isFocus: newIsFocus));
    }
    notifyListeners();
  }

  Future<void> createTask(Task task) async {
    if (_title != null && _title!.isNotEmpty) {
      await _taskProvider.createTask(task);
    }
  }
}
