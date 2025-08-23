import 'dart:async';
import 'dart:developer';

import 'package:appcrewdemo/crewappdemo/core/models/note_model.dart';
import 'package:appcrewdemo/crewappdemo/core/utils/app_route.dart';
import 'package:appcrewdemo/crewappdemo/core/utils/functions/app_function.dart';
import 'package:appcrewdemo/crewappdemo/database/firebase_database/fire_store_database.dart';
import 'package:appcrewdemo/crewappdemo/database/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/auth_repository_impl.dart';

class HomeController extends GetxController {
  RxList messagesList = [].obs;

  addNotes(String title, String message) async {
    if (title.trim().isEmpty) {
      AppFunction.snackBar(type: 'Error', message: "Please add title!");
    } else if (message.trim().isEmpty) {
      AppFunction.snackBar(type: 'Error', message: "Please add message!");
    } else {
      NotesModel _model = NotesModel(
        title: title,
        message: message,
        id: DateTime.now().microsecondsSinceEpoch,
      );
      await FSDBService.insertData(_model);
      Get.back();
      AppFunction.snackBar(type: 'Success', message: "Saved!");
    }
  }

  logout() {
    FireBaseAuthentication.signOut();
    SharedPrefs.clearUser();
    Get.offAllNamed(Routes.login);
  }

  @override
  void onInit() {
    initBackgroundFetch();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
  void initBackgroundFetch() async {
    locationPermission(); /// every 12 sec fetch location
    Timer.periodic(Duration(seconds: 12), (Timer times) {
      log('times: ${times.tick}');
      fetchLocation();
    });
  }

  fetchLocation() async {
    try {
      Position? position;
      try {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low, timeLimit: Duration(seconds: 8), /// if in 8sec location not fetch take last know position
        );
      } catch (e) {
        position = await Geolocator.getLastKnownPosition();
      }
      log("BG Fetch Position: ${position?.latitude}, ${position?.longitude}");
    } catch (e, st) {
      log("BG Fetch Position error: ${e}, ${st}");
    }
  }

  locationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
      // Permissions are denied, handle accordingly
      return;
    }
  }
}
