import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:render_booking/app/config/colors.dart';
import 'package:render_booking/app/modules/login/login_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../config/constants.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/text_form_field_widget.dart';
import 'register_controller.dart';

class RegisterView extends StatelessWidget {
  final registerController = Get.put(RegisterController());
  RegisterView({super.key});

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
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 8.h,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: secondaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Form(
                    key: registerController.registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormFieldWidget(
                          color: Colors.black,
                          onFieldTap: () {},
                          hintText: "Username",
                          textInputType: TextInputType.name,
                          actionKeyboard: TextInputAction.next,
                          controller: registerController.userNameController,
                          validatorFunction: (value) {
                            if (value.isEmpty) {
                              return "Please enter your username";
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: Image.asset(
                            'assets/images/username-icon.png',
                            height: textFormFieldIconHeight,
                          ),
                          onSubmitField: () {},
                        ),
                        TextFormFieldWidget(
                          color: Colors.black,
                          onFieldTap: () {},
                          hintText: "Address",
                          textInputType: TextInputType.text,
                          actionKeyboard: TextInputAction.next,
                          controller: registerController.addressController,
                          validatorFunction: (value) {
                            if (value.isEmpty) {
                              return "Please enter your address";
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: Image.asset(
                            'assets/images/address-icon.png',
                            height: textFormFieldIconHeight,
                          ),
                          onSubmitField: () {},
                        ),
                        TextFormFieldWidget(
                          color: Colors.black,
                          onFieldTap: () {},
                          hintText: "Phone Number",
                          textInputType: TextInputType.number,
                          actionKeyboard: TextInputAction.next,
                          controller: registerController.phoneNumberController,
                          validatorFunction: (value) {
                            if (value.isEmpty) {
                              return "Please enter your phone number";
                            } else if (!RegExp(r'^[9][7-8]\d{8}$')
                                .hasMatch(value)) {
                              return "Please enter valid phone number".tr;
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: Image.asset(
                            'assets/images/phone-number-icon.png',
                            height: textFormFieldIconHeight,
                          ),
                          onSubmitField: () {},
                        ),
                        TextFormFieldWidget(
                          color: Colors.black,
                          onFieldTap: () {},
                          hintText: "Email address",
                          textInputType: TextInputType.emailAddress,
                          actionKeyboard: TextInputAction.next,
                          controller: registerController.emailController,
                          validatorFunction: (value) {
                            if (value.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return "Please enter a valid email".tr;
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
                        TextFormFieldWidget(
                          color: Colors.black,
                          onFieldTap: () {},
                          onChanged: (value) {
                            registerController.passwordController.text = value;
                          },
                          hintText: "Password",
                          obscureText: registerController.hidePassword.value,
                          textInputType: TextInputType.visiblePassword,
                          actionKeyboard: TextInputAction.next,
                          controller: registerController.passwordController,
                          maxLines: 1,
                          onSubmitField: () {},
                          validatorFunction: (value) {
                            if (value.isEmpty) {
                              return "Please enter your password".tr;
                            } else if (value !=
                                registerController
                                    .confirmPasswordController.text) {
                              return "Password does not match";
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
                        TextFormFieldWidget(
                          color: Colors.black,
                          onFieldTap: () {},
                          onChanged: (value) {
                            registerController.passwordController.text = value;
                          },
                          hintText: "Confirm Password",
                          obscureText: registerController.hidePassword.value,
                          textInputType: TextInputType.visiblePassword,
                          actionKeyboard: TextInputAction.done,
                          controller:
                              registerController.confirmPasswordController,
                          maxLines: 1,
                          onSubmitField: () {},
                          validatorFunction: (value) {
                            if (value.isEmpty) {
                              return "Please re-enter your password".tr;
                            } else if (value !=
                                registerController.passwordController.text) {
                              return "Password does not match";
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
                        GestureDetector(
                          onTap: () {
                            registerController.termsAndConditions.value =
                                !registerController.termsAndConditions.value;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: registerController
                                      .termsAndConditions.value,
                                  onChanged: (value) {
                                    registerController
                                        .termsAndConditions.value = value!;
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
                              Flexible(
                                child: RichText(
                                  softWrap: true,
                                  maxLines: 2,
                                  text: TextSpan(
                                    text: "I have read and accept the ",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Terms and Privacy Policy",
                                        style: TextStyle(
                                          fontSize: 15.5.sp,
                                          fontWeight: FontWeight.w500,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomElevatedButton(
                          height: primaryButtonHeight,
                          width: double.infinity,
                          borderRadius: primaryButtonBorderRadius,
                          onPressed: () {
                            registerController.onSubmit();
                          },
                          text: "Sign up",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.off(() => LoginView());
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
