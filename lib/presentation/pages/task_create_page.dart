import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/presentation/widgets/task_is_done_check_box.dart';
import 'package:gtd_app/presentation/widgets/task_title.dart';
import 'package:provider/provider.dart';
import 'package:gtd_app/presentation/providers/task_form_provider.dart';

class TaskCreatePage extends StatefulWidget {
  static const String routeName = '/task-create';

  const TaskCreatePage({Key? key}) : super(key: key);

  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends State<TaskCreatePage> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskFormProvider = Provider.of<TaskFormProvider>(context);

    void _submitTask() async {
      await taskFormProvider.createTask(Task(
          title: taskFormProvider.title!,
          isDone: taskFormProvider.isDone,
          id: null));
      Navigator.pop(context);
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Task'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskTitle(
                  task: Task(
                      title: taskFormProvider.title ?? '',
                      isDone: taskFormProvider.isDone,
                      id: null),
                  focusNode: _focusNode),
              const SizedBox(height: 16.0),
              const Text('Task is done'),
              TaskIsDoneCheckBox(
                  value: taskFormProvider.isDone,
                  task: Task(
                      title: taskFormProvider.title ?? '',
                      isDone: taskFormProvider.isDone,
                      id: null)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _submitTask,
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
