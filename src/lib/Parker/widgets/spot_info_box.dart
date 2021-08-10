import 'package:flutter/material.dart';

import '../../models/parking_spot_v2.dart';
// import '../models/parking_spot.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class SpotInfoBox extends StatelessWidget {
  // final ParkingSpot spot;
  final ParkingSpotV2 spot;

  const SpotInfoBox({
    Key key,
    @required this.spot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: SizeConfig.screenWidth * 0.8,
      width: 80.w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            // width: 1,
            width: 0.6.sp,
            color: Colors.grey,
          ),
        ),
      ),
      margin: EdgeInsets.only(
        // top: SizeConfig.screenHeight * 0.03,
        // bottom: SizeConfig.screenHeight * 0.03,
        top: 3.h,
        bottom: 3.h,
      ),
      padding: EdgeInsets.only(
        // bottom: SizeConfig.screenHeight * 0.03,
        bottom: 3.h,
      ),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              "${spot.name}",
              // style: TextStyle(
              //     color: Colors.white,
              //     // fontSize: 30,
              //     fontSize: 21.sp,
              //     fontWeight: FontWeight.w800),
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            // height: SizeConfig.screenHeight * 0.02,
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.cyan,
                    // size: 35,
                    size: 22.sp,
                  ),
                  Text(
                    // TODO: Implement rating
                    spot.numRatings == 0
                        ? "No Ratings"
                        : "${spot.avgRating}(${spot.numRatings})",
                    style: TextStyle(
                      color: Colors.white,
                      // fontSize: 20,
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                // height: SizeConfig.screenHeight * 0.05,
                height: 5.h,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      // width: 1,
                      width: 0.6.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Max Height",
                    style: TextStyle(
                      // fontSize: 11,
                      fontSize: 8.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${spot.height}cm",
                    style: TextStyle(
                      // fontSize: 25,
                      fontSize: 17.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
