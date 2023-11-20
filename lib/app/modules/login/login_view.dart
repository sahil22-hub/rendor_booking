import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:render_booking/app/config/constants.dart';
import 'package:render_booking/app/modules/login/login_controller.dart';
import 'package:render_booking/app/widgets/custom_elevated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../config/colors.dart';
import '../../widgets/text_form_field_widget.dart';

class LoginView extends StatelessWidget {
  final loginController = Get.put(LoginController());
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: mainHorizontalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // take 40% of the screen height
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormFieldWidget(
                            color: Colors.black,
                            onFieldTap: () {},
                            hintText: "Email address",
                            textInputType: TextInputType.emailAddress,
                            actionKeyboard: TextInputAction.next,
                            controller: loginController.emailController,
                            validatorFunction: (value) {
                              if (value.isEmpty) {
                                return "Please enter your email";
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: Image.asset(
                              'assets/images/email-icon.png',
                              height: 3.h,
                            ),
                            onSubmitField: () {},
                          ),
                          TextFormFieldWidget(
                            color: Colors.black,
                            onFieldTap: () {},
                            onChanged: (value) {
                              loginController.passwordController.text = value;
                            },
                            hintText: "Password",
                            obscureText: loginController.hidePassword.value,
                            textInputType: TextInputType.visiblePassword,
                            actionKeyboard: TextInputAction.done,
                            controller: loginController.passwordController,
                            maxLines: 1,
                            onSubmitField: () {},
                            validatorFunction: (value) {
                              if (value.isEmpty) {
                                return "Please enter your password".tr;
                              } else {
                                return null;
                              }
                            },
                            suffixIcon: Image.asset(
                              'assets/images/password-icon.png',
                              height: 3.h,
                            ),
                            last: true,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            height: 20,
                            child: TextButton(
                              // remove padding on button
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                    height: 52,
                                    width: double.infinity,
                                    child: CustomElevatedButton(
                                      height: primaryButtonHeight,
                                      width: double.infinity,
                                      borderRadius: primaryButtonBorderRadius,
                                      onPressed: () {},
                                      text: "Sign in",
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
