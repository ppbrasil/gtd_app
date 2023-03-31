import 'package:flutter/material.dart';
import 'package:gtd_app/presentation/providers/task_form_provider.dart';
import 'package:provider/provider.dart';

class TaskForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final ValueChanged<bool?>? onIsDoneChanged;
  final bool isDone;
  final VoidCallback onEditingComplete;

  const TaskForm({
    Key? key,
    required this.formKey,
    required this.titleController,
    this.onIsDoneChanged,
    required this.isDone,
    required this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CheckboxListTile(
              value: isDone,
              onChanged: onIsDoneChanged,
              title: const Text('Task completed'),
            ),
            TextFormField(
              controller: titleController,
              maxLength: 50,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onEditingComplete: onEditingComplete,
              decoration: const InputDecoration(
                labelText: 'Task Title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title can\'t be empty';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
