import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({
    super.key,
    required this.text,
    this.icon,
    required this.color,
    this.isRequired,
  });

  final String text;
  final String? icon;
  final Color? color;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: color,
            ),
            children: [
              TextSpan(
                text: isRequired != null && isRequired == false ? '' : ' *',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}
