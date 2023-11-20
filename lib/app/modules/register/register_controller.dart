import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:render_booking/app/widgets/snackbar.dart';

class RegisterController extends GetxController {
  final storage = GetStorage();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final hidePassword = true.obs;
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final termsAndConditions = false.obs;
  final isLoginLoading = false.obs;

  void onSubmit() {
    if (registerFormKey.currentState!.validate() &&
        termsAndConditions.value == false) {
      getSnackBar(
        message: "Please accept terms and conditions",
        bgColor: Colors.red,
        leadingIcon: Icons.error_outline,
      );
    }
    if (registerFormKey.currentState!.validate() &&
        termsAndConditions.value == true) {
      register();
    }
  }

  void register() async {}
}
