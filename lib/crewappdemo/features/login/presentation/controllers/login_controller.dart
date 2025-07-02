import 'dart:developer';

import 'package:appcrewdemo/crewappdemo/core/utils/app_route.dart';
import 'package:appcrewdemo/crewappdemo/core/utils/functions/app_function.dart';
import 'package:appcrewdemo/crewappdemo/data/repositories/auth_repository_impl.dart';
import 'package:appcrewdemo/crewappdemo/database/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  Future<void> login() async {
    if (isLoading.value) return; /// Tp avoid multiple clicks
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text;

      try {
        isLoading(true);
        UserCredential? user = await FireBaseAuthentication.signInWithEmail(
          email: email,
          password: password,
        );
        log(user.user.toString());
        if (user.user?.uid != null) {
          log(user.user.toString());
          AppFunction.snackBar(type: 'Success', message: "Login successful!");
          if (user.user != null) {
            SharedPrefs.setString(key: PrefString.uid, value: user.user!.uid);
            SharedPrefs.setString(key: PrefString.email, value: user.user!.email ?? '');
          }
          clearTextControllers();
          isLoading(false);
          Get.offAllNamed(Routes.home);
        }
      } catch (e) {
        isLoading(false);
        AppFunction.snackBar(type: 'Error', message: e.toString());
      }
    }
  }

  Future<void> singUp() async {
    if (isLoading.value) return; /// Tp avoid multiple clicks
    if (signUpFormKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text;
      try {
        isLoading(false);
        UserCredential? user = await FireBaseAuthentication.registerWithEmail(
          email: email,
          password: password,
        );
        log(user.user.toString());
        if (user.user?.uid != null) {
          log(user.user.toString());
          AppFunction.snackBar(type: 'Success', message: "Registered successful!");
          clearTextControllers();
          isLoading(false);
          Get.offAllNamed(Routes.login);
        }
      } catch (e) {
        isLoading(false);
        AppFunction.snackBar(type: 'Error', message: e.toString());
      }
    }
  }

  void clearTextControllers() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
