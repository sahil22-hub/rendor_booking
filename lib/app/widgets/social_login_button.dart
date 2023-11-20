import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../config/colors.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double borderRadius;
  final String icon;

  const SocialLoginButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 2.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        border: Border.all(
          color: lightColor,
        ),
      ),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          shadowColor: Colors.white,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
              child: Image.asset(
                icon,
                height: 2.5.h,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              "Login with $text",
              style: TextStyle(
                color: lightColor,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
