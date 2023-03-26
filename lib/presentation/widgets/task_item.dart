import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/presentation/pages/task_details_page.dart';
import 'package:gtd_app/presentation/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (bool? newValue) {
            if (newValue != null) {
              _toggleTaskIsDone(context, newValue);
            }
          },
        ),
        title: Text(task.title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailsPage(task: task),
            ),
          ).then((_) {
            Provider.of<TaskProvider>(context, listen: false).fetchTasks();
          });
        },
      ),
    );
  }

  void _toggleTaskIsDone(BuildContext context, bool newValue) async {
    final updatedTask = task.copyWith(isDone: newValue);
    final provider = context.read<TaskProvider>();
    await provider.updateTask(updatedTask);
  }
}
