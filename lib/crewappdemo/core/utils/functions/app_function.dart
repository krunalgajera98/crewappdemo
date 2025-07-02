import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFunction {
  static snackBar({required String type, required String message}) {
    return Get.snackbar(
      type,
      message,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      backgroundColor: type.toLowerCase().contains('error') ? Colors.red : Colors.green,
    );
  }
}