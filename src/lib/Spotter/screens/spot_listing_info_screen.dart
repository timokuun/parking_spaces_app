import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/parking_spot_v2.dart';

import './edit_spot_screen.dart';

import '../../widgets/spot_carousel.dart';
import '../widgets/ovular_FAB.dart';

class SpotListingInfoScreen extends StatefulWidget {
  final ParkingSpotV2 spot;

  SpotListingInfoScreen({this.spot});

  @override
  _SpotListingInfoScreenState createState() => _SpotListingInfoScreenState();
}

class _SpotListingInfoScreenState extends State<SpotListingInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Stack(
              children: [
                SpotCarousel(
                  // TODO: Convert "imageURL" to list of strings for images
                  images: widget.spot.imageUrls,
                  height: 40.h,
                ),
                // Back button
                Positioned(
                  top: 1.h,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      size: 43.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 1.h),
              child: Text(
                widget.spot.name,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Container(
              child: Text(
                widget.spot.address,
                style: TextStyle(color: Colors.grey, fontSize: 11.sp),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3.h),
              child: Column(
                children: [
                  Text(
                    "Status:",
                    style: TextStyle(
                      fontSize: 9.sp,
                    ),
                  ),
                  Text(
                    widget.spot.bought ? "RESERVED" : "OPEN",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: widget.spot.bought ? Colors.yellow : Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            // Row of Rating with Max Height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.cyan,
                      size: 19.sp,
                    ),
                    // Spot Rating
                    Text(
                      widget.spot.numRatings == 0
                          ? "No Ratings"
                          : "${widget.spot.avgRating}(${widget.spot.numRatings})",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                // Max Height
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Max Height:",
                        style: TextStyle(
                          fontSize: 9.sp,
                        ),
                      ),
                      Text(
                        "${widget.spot.height} cm",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        // Button to edit current spot
        floatingActionButton: OvularFAB(
          height: 6.h,
          width: 31.w,
          icon: Icons.edit,
          label: "Edit Spot",
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditSpotScreen(
                spot: widget.spot,
              ),
            ));
          },
        ),
      ),
    );
  }
}
