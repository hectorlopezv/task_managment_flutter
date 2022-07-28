import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

const baseUrl = "http://localhost:8082";

class DataService extends GetConnect implements GetxService {
  Future<Response> getData() async {
    Response response = await get(baseUrl + "/gettasks", headers: {
      "Content-Type": "application/json: charset=utf-8",
    });
    return response;
  }

  Future<Response> getTask(String id) async {
    Response response = await get(baseUrl + "/gettask/$id", headers: {
      "Content-Type": "application/json: charset=utf-8",
    });
    return response;
  }

  Future<Response> postData(Map data) async {
    Response response = await post(baseUrl + "/create", data, headers: {
      "Content-Type": "application/json: charset=utf-8",
    });
    return response;
  }

  Future<Response> updateData(Map data, String id) async {
    Response response = await post(baseUrl + "/update/$id", data, headers: {
      "Content-Type": "application/json: charset=utf-8",
    });
    return response;
  }

  Future<Response> deleteData(String id) async {
    Response response = await delete(baseUrl + "/delete/$id", headers: {
      "Content-Type": "application/json: charset=utf-8",
    });
    return response;
  }
}
