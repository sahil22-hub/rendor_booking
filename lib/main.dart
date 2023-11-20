import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:render_booking/app/config/colors.dart';
import 'package:render_booking/app/modules/login/login_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/services/storage/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => GetMaterialApp(
        title: 'Rendor Booking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // user #FF6A00 as primaryColor and #1A2C48 as secondaryColor
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: primaryColor,
            secondary: secondaryColor,
          ),
          useMaterial3: true,
        ),
        home: LoginView(),
        defaultTransition: Transition.fadeIn,
      ),
    );
  }
}
