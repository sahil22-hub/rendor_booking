import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../config/colors.dart';

class OverlayedLoadingScreen extends StatelessWidget {
  const OverlayedLoadingScreen({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    debugPrint(color.toString());
    return Stack(
      children: [
        // Blurred background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            color: const Color.fromARGB(102, 0, 0, 0).withOpacity(0.6),
          ),
        ),

        // Loading indicator
        Center(
            child: SpinKitCircle(
          color: color ?? primaryColor,
        )),
      ],
    );
  }
}
