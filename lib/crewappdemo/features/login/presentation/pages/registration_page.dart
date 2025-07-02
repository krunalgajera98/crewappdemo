import 'package:appcrewdemo/crewappdemo/core/utils/size_helper.dart';
import 'package:appcrewdemo/crewappdemo/core/validators/validators.dart';
import 'package:appcrewdemo/crewappdemo/features/custom_widgets/text_form_field.dart';
import 'package:appcrewdemo/crewappdemo/features/login/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: controller.signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Register User",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 32),
                    CustomTextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      hintText: 'Email',
                      focusNode: FocusNode(),
                    ),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      obscureText: true,
                      validator: validatePassword,
                      focusNode: FocusNode(),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: controller.singUp,
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16)),
                      child: Obx(
                        () =>
                            controller.isLoading.value
                                ? const CircularProgressIndicator()
                                : Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ).beResponsive;
  }
}
