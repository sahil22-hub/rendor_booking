import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:render_booking/app/modules/login/login_view.dart';
import 'package:render_booking/app/modules/user_modules/home/view/home_view.dart';
import 'package:render_booking/app/modules/user_modules/user_mainScreen/userMainScreen.dart';
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
          useMaterial3: true,
        ),
        home: UserMainScreen(),
        defaultTransition: Transition.fadeIn,
      ),
    );
  }
}
