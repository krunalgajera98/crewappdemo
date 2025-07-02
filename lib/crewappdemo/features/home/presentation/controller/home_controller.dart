import 'dart:async';
import 'dart:developer';

import 'package:appcrewdemo/crewappdemo/core/models/note_model.dart';
import 'package:appcrewdemo/crewappdemo/core/utils/app_route.dart';
import 'package:appcrewdemo/crewappdemo/core/utils/functions/app_function.dart';
import 'package:appcrewdemo/crewappdemo/database/firebase_database/fire_store_database.dart';
import 'package:appcrewdemo/crewappdemo/database/shared_preferences.dart';
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

  logout(){
    FireBaseAuthentication.signOut();
    SharedPrefs.clearUser();
    Get.offAllNamed(Routes.login);
  }
  @override
  void dispose() {
    super.dispose();
  }
}
