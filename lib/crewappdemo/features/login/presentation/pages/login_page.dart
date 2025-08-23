import 'package:appcrewdemo/crewappdemo/core/utils/app_route.dart';
import 'package:appcrewdemo/crewappdemo/core/utils/size_helper.dart';
import 'package:appcrewdemo/crewappdemo/core/validators/validators.dart';
import 'package:appcrewdemo/crewappdemo/core/values/strings/strings.dart';
import 'package:appcrewdemo/crewappdemo/features/custom_widgets/text_form_field.dart';
import 'package:appcrewdemo/crewappdemo/features/login/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  LoginController controller = Get.find<LoginController>();

  /// .beResponsive is used for responsive ui i dont have table so it's remaining for test
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.empDemo);
                      },
                      child: Text(
                        'EMP DEMO',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue[900],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      AppString.wlcMsg,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(AppString.loginToCont, style: TextStyle(fontSize: 16, color: Colors.grey)),

                    SizedBox(height: 32),
                    CustomTextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      hintText: AppString.email,
                      focusNode: FocusNode(),
                    ),
                    SizedBox(height: 16),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      obscureText: true,
                      hintText: AppString.password,
                      validator: validatePassword,
                      focusNode: FocusNode(),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: controller.login,
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16)),
                      child: Obx(
                        () =>
                            controller.isLoading.value
                                ? const CircularProgressIndicator()
                                : Text(AppString.login),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.registrationPage);
                        },
                        child: Text(
                          AppString.signUpMsg,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue[900],
                            fontSize: 16,
                          ),
                        ),
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
