import 'package:flutter/material.dart';
import 'package:task_manager/screens/add_tasks_screen.dart';
import 'package:task_manager/screens/all_task_screen.dart';
import 'package:task_manager/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(),
      routes: {
        '/': (context) => HomeScreen(),
        "/addTask": (context) => AddTaskScreen(),
        "/allTask": (context) => AllTaskScreen(),
      },
    );
  }
}
