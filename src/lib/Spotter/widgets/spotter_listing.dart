import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../theme.dart';

import '../../models/parking_spot_v2.dart';

// TODO: Need to re-design Spot info (add rating, price, availablilty tag)

class SpotterListing extends StatelessWidget {
  final ParkingSpotV2 spot;

  SpotterListing({this.spot});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        splashColor: customCyan,
        radius: 500.sp,
        onTap: () {
          // Pass spot id to SpotInfoScreen for DB call
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => SpotInfoScreen(
          //       spot: spot,
          //     ),
          //   ),
          // );
        },
        child: Container(
          height: 17.h,
          margin: EdgeInsets.symmetric(
            vertical: 2.5.h,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Spot information
              Positioned(
                left: 2.5.w,
                child: Container(
                    height: 17.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      border: Border.all(
                        color: customCyan,
                        width: 1.5.sp,
                      ),
                      color: Colors.transparent,
                    ),
                    margin: EdgeInsets.only(
                      left: 8.w,
                    ),
                    padding: EdgeInsets.only(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "OPEN",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${spot.name}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 2.5.sp,
                            ),
                            if (spot.bought)
                              Text(
                                "Time Left: 2:07",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                        spot.bought
                            ? Row(
                                children: [
                                  Text(
                                    "Current Rental Time: 1:30",
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                    ),
                                  )
                                ],
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
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                      Text(
                                        "\$${spot.price}/hr",
                                        style: TextStyle(
                                          color: Colors.white,
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
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                      Text(
                                        "${spot.height}",
                                        style: TextStyle(
                                          color: Colors.white,
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
                left: 2.5.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.sp),
                  child: Image.network(
                    "${spot.imageUrl}",
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
