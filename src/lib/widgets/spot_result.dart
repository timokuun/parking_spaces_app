import 'package:car_park_login/models/parking_spot_v2.dart';
import 'package:car_park_login/screens/spot_info_screen.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';
import '../theme.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

// TODO: add bool for in activeSpotsScreen or in search result
class SpotResult extends StatelessWidget {
  final ParkingSpotV2 spot;

  const SpotResult({
    this.spot,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      color: customBlack,
      child: InkWell(
        splashColor: customCyan,
        // radius: 500,
        radius: 500.sp,
        onTap: () {
          // Pass spot id to SpotInfoScreen for DB call
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SpotInfoScreen(
                spot: spot,
              ),
            ),
          );
        },
        child: Container(
          // height: SizeConfig.screenHeight * 0.17,
          height: 17.h,
          margin: EdgeInsets.symmetric(
            // vertical: 20,
            vertical: 2.5.h,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Spot information
              Positioned(
                // left: 10,
                left: 2.5.w,
                child: Container(
                    // height: SizeConfig.screenHeight * 0.17,
                    // width: SizeConfig.screenWidth * 0.85,
                    height: 17.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      borderRadius: BorderRadius.circular(15.sp),
                      border: Border.all(
                        color: customCyan,
                        // width: 2,
                        width: 1.5.sp,
                      ),
                      color: Colors.transparent,
                    ),
                    margin: EdgeInsets.only(
                      // left: 35,
                      left: 8.w,
                    ),
                    padding: EdgeInsets.only(
                      // left: 85,
                      // right: 10,
                      left: 20.w,
                      right: 5.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // TODO: Spacing is weird for price and height?
                        //        maybe left align with name/address?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${spot.name}",
                              style: TextStyle(
                                // fontSize: 20,
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              // height: 3,
                              height: 2.5.sp,
                            ),
                            Text(
                              "${spot.address}}",
                              style: TextStyle(
                                color: Colors.grey[400],
                                // color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        spot.bought
                            ? Row(
                                children: [Text("Current Rental Time: 1:30")],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Price",
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          // fontSize: 12,
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                      Text(
                                        "\$${spot.price}/hr",
                                        style: TextStyle(
                                          color: Colors.white,
                                          // fontSize: 18,
                                          fontSize: 13.5.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Height",
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          // color: Colors.grey,
                                          // fontSize: 12,
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                      Text(
                                        "${spot.height}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          // fontSize: 18,
                                          fontSize: 13.5.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                      ],
                    )),
              ),
              // TODO: Image (production) / Icon(development)
              Positioned(
                // left: 10,
                left: 2.5.w,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(20),
                  borderRadius: BorderRadius.circular(15.sp),
                  child: Image.network(
                    "${spot.imageUrl}",
                    // height: 110,
                    // width: 110,
                    height: 13.h,
                    width: 26.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
