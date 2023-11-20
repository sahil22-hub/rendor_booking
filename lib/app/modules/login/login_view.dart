import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:render_booking/app/config/constants.dart';
import 'package:render_booking/app/modules/login/login_controller.dart';
import 'package:render_booking/app/modules/register/register_view.dart';
import 'package:render_booking/app/widgets/custom_elevated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../config/colors.dart';
import '../../widgets/social_login_button.dart';
import '../../widgets/text_form_field_widget.dart';

class LoginView extends StatelessWidget {
  final loginController = Get.put(LoginController());
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mainHorizontalPadding,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Welcome to\n",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              height: 1.4,
                            ),
                            children: [
                              TextSpan(
                                text: "Render Booking App",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w800,
                                  color: primaryColor,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.3.h,
                        ),
                        Text(
                          "Sign in to continue",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: lightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Form(
                    key: loginController.loginFormKey,
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
                            height: textFormFieldIconHeight,
                          ),
                          onSubmitField: () {},
                        ),
                        SizedBox(
                          height: 1.h,
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
                            height: textFormFieldIconHeight,
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
                            onPressed: () {
                              Get.off(() => RegisterView());
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            loginController.rememberMe.value =
                                !loginController.rememberMe.value;
                          },
                          child: Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: loginController.rememberMe.value,
                                  onChanged: (value) {
                                    loginController.rememberMe.value = value!;
                                  },
                                  activeColor: primaryColor,
                                  checkColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.5),
                                  ),
                                  splashRadius: 1.5.h,
                                  side: const BorderSide(
                                    color: primaryColor,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0,
                                  color: lightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomElevatedButton(
                          height: primaryButtonHeight,
                          width: double.infinity,
                          borderRadius: primaryButtonBorderRadius,
                          onPressed: () {
                            loginController.onSubmit();
                          },
                          text: "Sign in",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0,
                          color: lightColor,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                  // 3 social media buttons with icon on the left and text on the right google, facebook and apple
                  SizedBox(
                    height: 3.h,
                  ),
                  SocialLoginButton(
                    height: primaryButtonHeight,
                    width: double.infinity,
                    borderRadius: 10.0,
                    onPressed: () {},
                    text: "Google",
                    icon: 'assets/images/google-icon.png',
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  // facebook button
                  SocialLoginButton(
                    height: primaryButtonHeight,
                    width: double.infinity,
                    borderRadius: 10.0,
                    onPressed: () {},
                    text: "Facebook",
                    icon: 'assets/images/facebook-icon.png',
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  // apple button
                  SocialLoginButton(
                    height: primaryButtonHeight,
                    width: double.infinity,
                    borderRadius: 10.0,
                    onPressed: () {},
                    text: "Apple",
                    icon: 'assets/images/apple-icon.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
