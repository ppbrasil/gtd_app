import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/presentation/providers/task_provider.dart';
import 'package:provider/provider.dart';

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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            onEditingComplete: _createTask,
            decoration: const InputDecoration(
              labelText: 'Task Title',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Title can\'t be empty';
              }
              return null;
            },
            onChanged: (value) {},
          ),
        ),
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
      final newTask = Task(title: newTitle, isDone: true);
      final provider = context.read<TaskProvider>();
      await provider.createTask(newTask);
      Navigator.of(context)
          .pop(true); // Return 'true' to indicate a new task was created
    }
  }
}
