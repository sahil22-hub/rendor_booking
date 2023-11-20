import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_dissatisfied,
            size: 20.h,
            color: Colors.grey,
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            'No Data',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            'Oops! Looks like there is no data available.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
