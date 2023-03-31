import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:provider/provider.dart';
import 'package:gtd_app/presentation/providers/task_form_provider.dart';

class TaskIsDoneCheckBox extends StatefulWidget {
  final bool value;
  final Task task;

  const TaskIsDoneCheckBox(
      {super.key, required this.value, required this.task});

  @override
  State<TaskIsDoneCheckBox> createState() => _TaskIsDoneCheckBoxState();
}

class _TaskIsDoneCheckBoxState extends State<TaskIsDoneCheckBox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  void _onChanged(bool? newValue) {
    if (newValue != null) {
      setState(() {
        _value = newValue;
      });
      final taskFormProvider =
          Provider.of<TaskFormProvider>(context, listen: false);
      taskFormProvider.updateIsDone(newValue, widget.task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _value,
      onChanged: _onChanged,
    );
  }
}
