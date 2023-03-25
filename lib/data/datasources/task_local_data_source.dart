import 'package:gtd_app/core/entities/task.dart';

class TaskLocalDataSource {
  Future<List<Task>> getTasks() async {
    // hard-coded list of tasks
    return [
      Task(title: 'Task 1'),
      Task(title: 'Task 2'),
      Task(title: 'Task 3'),
      Task(title: 'Task 4'),
      Task(title: 'Task 5'),
      Task(title: 'Task 6'),
      Task(title: 'Task 7'),
      Task(title: 'Task 8'),
      Task(title: 'Task 9'),
      Task(title: 'Task 10'),
    ];
  }
}
