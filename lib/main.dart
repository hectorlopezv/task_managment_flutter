import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/data_controller.dart';
import 'package:task_manager/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> loadData() async {
    await Get.find<DataController>().getData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return GetMaterialApp(
      title: 'Task Manager',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
