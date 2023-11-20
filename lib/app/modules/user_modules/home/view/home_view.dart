import "dart:math";

import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:responsive_sizer/responsive_sizer.dart";

import "../../../../config/colors.dart";
import "../../../../config/constants.dart";

class HomeView extends StatelessWidget {
  HomeView({super.key});
  List carImages = [
    'assets/images/car1.jpg',
    'assets/images/car2.jpg',
    'assets/images/car3.png',
    'assets/images/car4.webp',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 45.h,
              child: Stack(
                children: [
                  Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35.sp),
                        bottomRight: Radius.circular(35.sp),
                      ),
                      color: primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            title: const Text(
                              'Kathmandu, Nepal',
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                            child: Text(
                              'What vehicle type do you want to rent?',
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 2.h),
                            width: 80.w,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFFFFFFF),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                /* -- Text and Icon -- */
                                hintText:
                                    "Search type, category,location .....",
                                hintStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFFB3B1B1),
                                ), // TextStyle
                                suffixIcon: const Icon(
                                  Icons.search,
                                  size: 26,
                                  color: Colors.black54,
                                ), // Icon
                                /* -- Border Styling -- */
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    width: 2.0,
                                    // color: Color(0xFFFF0000),
                                  ), // BorderSide
                                ), //
                              ),
                            ),
                            //  const SearchBar(
                            //   hintText: 'Search type, category,location .....',
                            // ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5.w,
                    bottom: 0,
                    child: Container(
                      height: 20.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 10.h,
                          child: Image.asset('assets/images/car4.webp'),
                        ),
                        const Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sports Car',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('8 cars',
                                    style: TextStyle(color: Colors.grey)),
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.arrow_forward)),
                              ],
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                  Positioned(
                    right: 5.w,
                    bottom: 0,
                    child: Container(
                      height: 20.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 10.h,
                          child: Image.asset('assets/images/car3.png'),
                        ),
                        const Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Family Car',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('17 cars',
                                    style: TextStyle(color: Colors.grey)),
                                IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.arrow_forward)),
                              ],
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Text(
                'Nearby listing',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
              ),
            ),
            Carousel(),
            // CarouselSlider(
            //   items: carImages
            //       .map((item) => Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(30),
            //             ),
            //             child: Image.asset(
            //               item,
            //               fit: BoxFit.fill,
            //               width: 1000,
            //             ),
            //           ))
            //       .toList(),
            //   options: CarouselOptions(
            //     // height: 20.h,
            //     enlargeFactor: 0.3,
            //     viewportFraction: 0.6,
            //     enlargeCenterPage: true,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  Carousel({super.key});
  List carImages = [
    'assets/images/car1.jpg',
    'assets/images/car2.jpg',
    'assets/images/car3.png',
    'assets/images/car4.webp',
  ];
  List<String> price = [
    'Rs. 7k/day'
        'Rs. 10k/day'
        'Rs. 4k/day'
        'Rs. 5k/day'
  ];
  List<String> carNames = [
    'Suzuki Alto'
        'Honda x'
        'Nexon ev'
        'Honda z'
  ];
  // Carousel slider
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: CarouselSlider.builder(
        itemCount: carImages.length,
        itemBuilder: (context, index, realIndex) {
          return Stack(
            children: [
              Container(
                height: 30.h,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 211, 204, 204)),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    carImages[index],
                    fit: BoxFit.fill,
                    // width: double.infinity,
                    // height: Adaptive.h(20),
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      return child;
                    },
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  height: 4.h,
                  width: 20.w,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Available',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 8.h,
                  width: 50.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sports car',
                        style: TextStyle(
                            color: secondaryColor, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Rs. 10k/day',
                            style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 3.h,
                            width: 20.w,
                            decoration: const BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  10,
                                ),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Book Now',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
        options: CarouselOptions(
          enlargeCenterPage: true,
          viewportFraction: 0.6,

          // autoPlayInterval: const Duration(seconds: 5),
          height: Adaptive.h(30),
          onPageChanged: (index, reason) {
            // setState(() {
            //   activeIndex = index;
            // });
          },
        ),
      ),
    );
  }
}
