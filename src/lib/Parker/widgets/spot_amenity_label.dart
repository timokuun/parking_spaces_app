import 'package:flutter/material.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class SpotAmenityLabel extends StatelessWidget {
  final String name;
  final Color backgroundColor;
  final Color fontColor;

  SpotAmenityLabel({
    @required this.name,
    @required this.backgroundColor,
    @required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 0.75.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        // borderRadius: BorderRadius.circular(10),
        borderRadius: BorderRadius.circular(7.sp),
        color: backgroundColor,
      ),
      child: FittedBox(
        fit: BoxFit.none,
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: fontColor,
              // fontSize: 14,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
