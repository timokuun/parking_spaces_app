import 'package:flutter/material.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class DraggableIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.4.h,
      color: Theme.of(context).accentColor,
      margin: EdgeInsets.only(
        left: 43.w,
        right: 43.w,
        bottom: 2.h,
      ),
    );
  }
}
