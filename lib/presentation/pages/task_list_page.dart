import 'package:flutter/material.dart';
import 'package:gtd_app/presentation/pages/task_create_page.dart';
import 'package:gtd_app/presentation/providers/task_provider.dart';
import 'package:gtd_app/presentation/widgets/task_item.dart';
import 'package:provider/provider.dart';

class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: FutureBuilder(
        future: Provider.of<TaskProvider>(context, listen: false).fetchTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Consumer<TaskProvider>(
              builder: (context, taskProvider, child) {
                return ListView.builder(
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskProvider.tasks[index];
                    return TaskItem(task: task);
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to the CreateTaskPage and wait for the result.
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTaskPage(),
            ),
          );

          // Refresh the task list if a new task was created.
          if (result == true) {
            Provider.of<TaskProvider>(context, listen: false).fetchTasks();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
