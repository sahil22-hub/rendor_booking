import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:render_booking/app/modules/user_modules/home/view/home_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../config/colors.dart';

class UserMainScreen extends StatelessWidget {
  UserMainScreen({super.key});

  var currentTab = 0.obs;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        child: BottomAppBar(
          color: secondaryColor,
          child: Container(
            height: 0.07.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.sp),
                topRight: Radius.circular(15.sp),
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      // splashColor: secondaryColor,
                      onTap: () {
                        // currentScreen = const HomeView();
                        currentTab.value = 0;
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab.value == 0
                                ? primaryColor
                                : Colors.white,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: currentTab.value == 0
                                    ? primaryColor
                                    : Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: GestureDetector(
                      // splashColor: secondaryColor,
                      onTap: () {
                        // currentScreen = const HomeView();
                        currentTab.value = 1;
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.email,
                            color: currentTab.value == 1
                                ? primaryColor
                                : Colors.white,
                          ),
                          Text(
                            "Message",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: currentTab.value == 1
                                    ? primaryColor
                                    : Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: GestureDetector(
                      // splashColor: secondaryColor,
                      onTap: () {
                        // currentScreen = const HomeView();
                        currentTab.value = 2;
                        print(currentTab.value);
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: currentTab.value == 2
                                ? primaryColor
                                : Colors.white,
                          ),
                          Text(
                            "Wishlist",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: currentTab.value == 2
                                    ? primaryColor
                                    : Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // currentScreen = const HomeView();
                        currentTab.value = 3;
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.person,
                            color: currentTab.value == 3
                                ? primaryColor
                                : Colors.white,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: currentTab.value == 3
                                    ? primaryColor
                                    : Colors.white),
                          ),
                        ],
                      ),
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
