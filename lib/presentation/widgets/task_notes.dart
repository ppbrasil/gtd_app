import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:provider/provider.dart';
import 'package:gtd_app/presentation/providers/task_form_provider.dart';

class TaskNotes extends StatefulWidget {
  final Task task;
  final Function(bool) setIsLoading;

  const TaskNotes({
    Key? key,
    required this.task,
    required this.setIsLoading,
  }) : super(key: key);

  @override
  State<TaskNotes> createState() => _TaskNotesState();
}

class _TaskNotesState extends State<TaskNotes> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController(text: widget.task.notes);
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

  Future<void> _onEditingComplete(String newNotes) async {
    final taskFormProvider =
        Provider.of<TaskFormProvider>(context, listen: false);
    widget.setIsLoading(true);
    await taskFormProvider.updateNotes(newNotes, widget.task);
    widget.setIsLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      controller: _controller,
      focusNode: _focusNode,
      decoration: const InputDecoration(
        labelText: 'Notes',
        hintText: 'Enter your notes here',
      ),
    );
  }
}
