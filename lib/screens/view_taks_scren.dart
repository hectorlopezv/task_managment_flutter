import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/data_controller.dart';

class ViewTaskScreen extends StatelessWidget {
  final int id;
  const ViewTaskScreen({Key? key, required this.id}) : super(key: key);

  _loadsingleTask() async {
    await Get.find<DataController>().getSingleData(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _loadsingleTask(),
        builder: (context, snapshot) {
          return Container();
        },
      ),
    );
  }
}
