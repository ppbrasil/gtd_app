import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:provider/provider.dart';
import 'package:gtd_app/presentation/providers/task_form_provider.dart';

class TaskTitle extends StatefulWidget {
  final Task task;
  final Function(bool) setIsLoading;

  const TaskTitle({
    Key? key,
    required this.task,
    required this.setIsLoading,
  }) : super(key: key);

  @override
  State<TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<TaskTitle> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController(text: widget.task.title);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        widget.setIsLoading(true);
      }
      if (!_focusNode.hasFocus) {
        _onEditingComplete(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _onEditingComplete(String newTitle) async {
    final taskFormProvider =
        Provider.of<TaskFormProvider>(context, listen: false);
    widget.setIsLoading(true);
    await taskFormProvider.updateTitle(newTitle, widget.task);
    widget.setIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: const InputDecoration(
        labelText: 'Task title',
      ),
    );
  }
}
