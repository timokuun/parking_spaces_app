import 'package:flutter/material.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class PlaceholderImage extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  const PlaceholderImage({
    Key key,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(20),
        borderRadius: BorderRadius.circular(15.sp),
        color: Theme.of(context).primaryColor,
      ),
      margin: margin,
      // height: 200,
      // width: 200,
      height: 24.h,
      width: 24.h,
      child: Center(
        child: Text("IMAGE GOES HERE"),
      ),
    );
  }
}
