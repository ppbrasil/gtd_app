import 'package:flutter/material.dart';
import 'package:gtd_app/core/entities/task.dart';
import 'package:gtd_app/data/datasources/task_remote_data_source.dart';
import 'package:gtd_app/data/repositories/task_repository_impl.dart';
import 'package:gtd_app/presentation/pages/task_details_page.dart';
import 'package:gtd_app/presentation/pages/task_list_page.dart';
import 'package:gtd_app/presentation/providers/task_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final remoteDataSource = TaskRemoteDataSource();
  late TaskRepositoryImpl repository;

  MyApp({Key? key}) : super(key: key) {
    repository = TaskRepositoryImpl(remoteDataSource: remoteDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => TaskProvider(repository: repository)),
      ],
      child: MaterialApp(
        title: 'Task Management App',
        initialRoute: '/task-list',
        routes: {
          '/task-list': (context) => TaskListPage(),
          '/task-details': (context) {
            final Task task =
                ModalRoute.of(context)?.settings.arguments as Task;
            return TaskDetailsPage(task: task);
          },
        },
      ),
    );
  }
}
