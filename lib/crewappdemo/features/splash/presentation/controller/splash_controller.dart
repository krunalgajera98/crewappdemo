import 'dart:async';
import 'package:appcrewdemo/crewappdemo/core/utils/app_route.dart';
import 'package:geolocator/geolocator.dart';
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
    await _requestPermissions();
  }
  Future<void> _requestPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse) {
      permission = await Geolocator.requestPermission(); // Ask for "Always"
    }
  }
}
