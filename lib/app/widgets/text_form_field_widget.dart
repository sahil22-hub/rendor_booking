import 'package:flutter/material.dart';
import 'package:render_booking/app/config/colors.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.textInputType,
    required this.hintText,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.defaultText,
    this.focusNode,
    this.obscureText,
    this.controller,
    this.validatorFunction,
    required this.actionKeyboard,
    required this.onSubmitField,
    required this.onFieldTap,
    this.last,
    this.maxLines,
    required this.color,
  });

  final TextInputType textInputType;
  final String hintText;
  final Function? onChanged;
  final int? maxLines;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? defaultText;
  final FocusNode? focusNode;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function? validatorFunction;

  final TextInputAction actionKeyboard;
  final Function onSubmitField;
  final Function onFieldTap;
  final bool? last;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhysicalModel(
          color: Colors.white,
          elevation: 5.0,
          shadowColor: inputFieldBorderColor,
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            maxLines: maxLines,
            cursorColor: color,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: obscureText ?? false,
            keyboardType: textInputType,
            textInputAction: actionKeyboard,
            style: TextStyle(
              color: lightColor,
              fontSize: Adaptive.sp(16),
              fontWeight: FontWeight.w400,
            ),
            initialValue: defaultText,
            decoration: InputDecoration(
              prefix: Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                  right: 7.w,
                ),
                child: suffixIcon,
              ),
              prefixIcon: prefixIcon,
              suffixIconConstraints: BoxConstraints(
                minHeight: 2.8.h,
              ),
              hintText: hintText,
              contentPadding: const EdgeInsets.only(
                left: 0,
                right: 15,
                top: 15,
                bottom: 15,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintStyle: TextStyle(
                color: lightColor,
                fontSize: Adaptive.sp(16),
                fontWeight: FontWeight.w400,
              ),
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: Adaptive.sp(15),
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            controller: controller,
            validator: validatorFunction as String? Function(String?)?,
            onFieldSubmitted: (value) {},
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

// String commonValidation(String value, String messageError) {
//   var required = requiredValidator(value, messageError);
//   return required;
// }

// String requiredValidator(value, messageError) {
//   if (value.isEmpty) {
//     return messageError;
//   }
//   debugPrint(" No Error");
//   return '';
// }

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
