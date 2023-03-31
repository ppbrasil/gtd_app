import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:provider/provider.dart';
import 'package:gtd_app/presentation/providers/task_form_provider.dart';

class TaskTitle extends StatefulWidget {
  final Task task;
  final FocusNode focusNode;

  const TaskTitle({Key? key, required this.task, required this.focusNode})
      : super(key: key);

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.task.title);

    widget.focusNode.addListener(() {
      if (!widget.focusNode.hasFocus) {
        _onEditingComplete(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onEditingComplete(String newTitle) async {
    final taskFormProvider =
        Provider.of<TaskFormProvider>(context, listen: false);
    await taskFormProvider.updateTitle(newTitle, widget.task);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: widget.focusNode,
      decoration: const InputDecoration(
        labelText: 'Task title',
      ),
    );
  }
}
