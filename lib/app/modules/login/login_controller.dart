import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final storage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final hidePassword = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberMe = false.obs;
  final isLoginLoading = false.obs;

  void onSubmit() {
    if (loginFormKey.currentState!.validate()) {
      login();
    }
  }

  void login() async {}
}
