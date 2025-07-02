import 'dart:async';
import 'package:appcrewdemo/crewappdemo/core/utils/app_route.dart';
import 'package:get/get.dart';

import '../../../../database/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    getRoutes();
    super.onInit();
  }

  void getRoutes() async {
    Future.delayed(Duration(seconds: 3), () {
      if (SharedPrefs.getString(key: PrefString.uid).isNotEmpty) {
        return Get.offAndToNamed(Routes.home);
      }
      return Get.offAndToNamed(Routes.login);
    });
  }
}
