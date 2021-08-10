import 'package:flutter/material.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class SpotOwnerBox extends StatelessWidget {
  final String owner;

  const SpotOwnerBox({
    Key key,
    @required this.owner,
  }) : super(key: key);

  // TODO: How should we externalize the dimensions? width used for a lot...(21,37)

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: SizeConfig.screenHeight * 0.2,
      // width: SizeConfig.screenWidth,
      height: 20.h,
      margin: EdgeInsets.only(
        // top: SizeConfig.screenHeight * 0.04,
        // bottom: SizeConfig.screenHeight * 0.12,
        top: 4.h,
        bottom: 12.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              // borderRadius: BorderRadius.circular(15),
              borderRadius: BorderRadius.circular(10.sp),
              color: Colors.white,
            ),
            // margin: EdgeInsets.all(15),
            margin: EdgeInsets.all(12.sp),
            // height: SizeConfig.screenWidth * 0.18,
            // width: SizeConfig.screenWidth * 0.18,
            height: 18.w,
            width: 18.w,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "Provided by $owner",
              style: TextStyle(
                color: Colors.white,
                // fontSize: 20,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
