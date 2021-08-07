import 'package:flutter/material.dart';

import '../size_config.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class DraggableIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      // height: 3,
      height: 0.4.h,
      color: Colors.grey,
      margin: EdgeInsets.only(
        // left: SizeConfig.screenWidth * 0.45,
        // right: SizeConfig.screenWidth * 0.45,
        // bottom: 20,
        left: 43.w,
        right: 43.w,
        bottom: 2.h,
      ),
    );
  }
}
