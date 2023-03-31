// import 'package:flutter/material.dart';
// import 'package:gtd_app/core/entities/task.dart';
// import 'package:gtd_app/core/readiness.dart';
// import 'package:provider/provider.dart';
// import 'package:gtd_app/presentation/providers/task_form_provider.dart';

// class TaskReadinessDropdown extends StatefulWidget {
//   final Task task;
//   final FocusNode focusNode;
//   final Function(bool) setIsLoading;

//   const TaskReadinessDropdown(
//       {Key? key,
//       required this.task,
//       required this.focusNode,
//       required this.setIsLoading})
//       : super(key: key);

//   @override
//   State<TaskReadinessDropdown> createState() => _TaskReadinessDropdownState();
// }

// class _TaskReadinessDropdownState extends State<TaskReadinessDropdown> {
//   late FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = widget.focusNode;
//     _focusNode.addListener(() {
//       if (_focusNode.hasFocus) {
//         widget.setIsLoading(true);
//       } else {
//         widget.setIsLoading(false);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final taskFormProvider = Provider.of<TaskFormProvider>(context);

//     return DropdownButtonFormField<Readiness>(
//       value: widget.task.readiness,
//       onChanged: (Readiness? newValue) {
//         if (newValue != null) {
//           widget.setIsLoading(true);
//           taskFormProvider.updateReadiness(newValue, widget.task);
//           widget.setIsLoading(false);
//         }
//       },
//       items: Readiness.values
//           .map<DropdownMenuItem<Readiness>>((Readiness readiness) {
//         return DropdownMenuItem<Readiness>(
//           value: readiness,
//           child: Text(readiness.name),
//         );
//       }).toList(),
//       decoration: const InputDecoration(
//         labelText: 'Readiness',
//       ),
//       focusNode: _focusNode,
//     );
//   }
// }
