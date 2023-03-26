// CreateTaskPage
import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/presentation/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:gtd_app/presentation/widgets/task_form.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: TaskForm(
        formKey: _formKey,
        titleController: _titleController,
        onEditingComplete: _createTask,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createTask,
        child: Icon(Icons.check),
      ),
    );
  }

  void _createTask() async {
    if (_formKey.currentState!.validate()) {
      final newTitle = _titleController.text.trim();
      final newTask = Task(title: newTitle, isDone: false);
      final provider = context.read<TaskProvider>();
      await provider.createTask(newTask);
      Navigator.of(context)
          .pop(true); // Return 'true' to indicate a new task was created
    }
  }
}
