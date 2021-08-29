import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/spot_listing_info_screen.dart';

import '../../theme.dart';

import '../../models/parking_spot_v2.dart';

// TODO: Need to re-design Spot info (add rating, price, availablilty tag)

class SpotterListingElement extends StatelessWidget {
  final ParkingSpotV2 spot;

  SpotterListingElement({this.spot});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        splashColor: customCyan,
        radius: 500.sp,
        onTap: () {
          // TODO: Pass spot id to SpotListingInfoScreen for DB call -> if taken, cannot edit
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SpotListingInfoScreen(
                spot: spot,
              ),
            ),
          );
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
              Container(
                height: 17.h,
                width: 85.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  border: Border.all(color: customCyan, width: 1.5.sp),
                  color: Colors.transparent,
                ),
                margin: EdgeInsets.only(left: 10.5.w),
                padding: EdgeInsets.only(left: 20.w, right: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // TODO: Spacing is weird for price and height?
                    //        maybe left align with name/address?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                spot.bought ? "RESERVED" : "OPEN",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: spot.bought
                                      ? reservedColor
                                      : Colors.green,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
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
                        if (spot.bought)
                          Text(
                            "Time Left: 2:07",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 11.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Row for Rating widget
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.cyan,
                                    size: 16.sp,
                                  ),
                                  Text(
                                    // TODO: Implement rating
                                    spot.numRatings == 0
                                        ? "No Ratings"
                                        : "${spot.avgRating}(${spot.numRatings})",
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                              // TODO: Conditionalize this if spot is closed?
                              Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  "\$${spot.price}/hr",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // TODO: Image (production) / Icon(development)
              Positioned(
                left: 2.5.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.sp),
                  child: Image.network(
                    "${spot.imageUrls[0]}",
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
