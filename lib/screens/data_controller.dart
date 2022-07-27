import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task_manager/service/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];

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
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData({
      "task": task,
      "taskDetail": taskDetail,
    });
    if (response.statusCode == 200) {
      print("we create a new Task");
      update();
    } else {
      print("we didn't get data");
    }
  }
}
