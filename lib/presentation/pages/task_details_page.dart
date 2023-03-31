import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/presentation/widgets/task_is_done_check_box.dart';
import 'package:gtd_app/presentation/widgets/task_is_focus_check_box.dart';
import 'package:gtd_app/presentation/widgets/task_readiness_dropdown.dart';
import 'package:gtd_app/presentation/widgets/task_title.dart';
import 'package:provider/provider.dart';
import 'package:gtd_app/presentation/providers/task_form_provider.dart';

class TaskDetailsPage extends StatefulWidget {
  static const String routeName = '/task-details';

  const TaskDetailsPage({Key? key}) : super(key: key);

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  late FocusNode _focusNode;
  bool _isLoading = false;

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

  void _setIsLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskFormProvider = Provider.of<TaskFormProvider>(context);
    final task = Task(
        title: taskFormProvider.title ?? '',
        isDone: taskFormProvider.isDone,
        id: taskFormProvider.id);

    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        while (_isLoading) {
          await Future.delayed(const Duration(milliseconds: 10));
        }
        return true;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Task Details'),
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskTitle(
                  task: task,
                  setIsLoading: _setIsLoading,
                ),
                const SizedBox(height: 16.0),
                const Text('Task is done'),
                TaskIsDoneCheckBox(
                  value: taskFormProvider.isDone,
                  task: task,
                ),
                const Text('Task is focus'),
                TaskIsFocusCheckBox(
                  value: taskFormProvider.isFocus,
                  task: task,
                ),
                TaskReadinessDropdown(
                  task: task,
                  setIsLoading: _setIsLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
