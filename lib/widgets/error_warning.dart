import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/app_colors.dart';

class ErrorWarning {
  ErrorWarning._();

  /// The error message to display.
  static void taskErrorOrWrning(String taskname, String taskerrorOrWrning) {
    Get.snackbar(
      taskname,
      taskerrorOrWrning,
      backgroundColor: AppColors.mainColor,
      titleText: Text(
        taskname,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        taskerrorOrWrning,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.yellow,
        ),
      ),
    );
  }
}
