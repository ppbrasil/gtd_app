import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/presentation/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:gtd_app/data/datasources/task_remote_data_source.dart';

class TaskDetailsPage extends StatefulWidget {
  final Task task;

  const TaskDetailsPage({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDetailsPageState createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task.title),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _titleController,
                maxLength: 50,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onEditingComplete: _updateTaskTitle,
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
          ElevatedButton(
            onPressed: _deleteTask,
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _updateTaskTitle() async {
    if (_formKey.currentState!.validate()) {
      final newTitle = _titleController.text.trim();
      final updatedTask = widget.task.copyWith(title: newTitle);
      final provider = context.read<TaskProvider>();
      await provider.updateTask(updatedTask);
      Navigator.of(context).pop();
    }
  }

  void _deleteTask() async {
    final provider = context.read<TaskProvider>();
    await provider.disableTask(widget.task);
    Navigator.of(context).pop();
    // Provider.of<TaskProvider>(context, listen: false).fetchTasks();
  }
}
