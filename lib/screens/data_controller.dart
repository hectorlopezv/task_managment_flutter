import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task_manager/service/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  Map<String, dynamic> _singleData = {};
  List<dynamic> _myData = [];

  bool get isLoading => _isLoading;

  Map<String, dynamic> get singleData => _singleData;
  List<dynamic> get myData => _myData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData();
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we Got data");
      update();
    } else {
      print("we didn't get data");
    }
    update();
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData({
      "task_name": task,
      "task_detail": taskDetail,
    });
    if (response.statusCode == 200) {
      print("we create a new Task");
      update();
    } else {
      print("we didn't get data");
    }
    update();
  }

  Future<void> updateData(String task, String taskDetail, String id) async {
    _isLoading = true;
    final data = {
      "task_name": task,
      "task_detail": taskDetail,
    };
    Response response = await service.updateData(data, id);
    if (response.statusCode == 200) {
      print("we create a new Task");
      await getData();
      update();
    } else {
      print("we didn't get data");
    }
    update();
  }

  Future<void> getSingleData(String id) async {
    _isLoading = true;
    Response response = await service.getTask(id);
    if (response.statusCode == 200) {
      print("we create a new Task");
      _singleData = jsonDecode(response.body);
      update();
    } else {
      print("we didn't get data");
    }
    update();
  }

  Future<void> deleteData(String id) async {
    _isLoading = true;
    Response response = await service.deleteData(id);
    if (response.statusCode == 200) {
      print("we create a new Task");
      await getData();
      update();
    } else {
      print("we didn't get data");
    }
    update();
  }
}
