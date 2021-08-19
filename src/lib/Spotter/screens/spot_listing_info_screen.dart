import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../models/parking_spot_v2.dart';

// TODO: Move this to global?
import '../../Parker/widgets/spot_carousel.dart';
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
    return Scaffold(
      body: Column(
        children: [
          SpotCarousel(
            // TODO: Convert "imageURL" to list of strings for images
            images: [widget.spot.imageUrl],
            // height: SizeConfig.screenHeight * 0.4,
            height: 40.h,
          ),
        ],
      ),

      // Button to edit current spot
      floatingActionButton: OvularFAB(
        height: 6.h,
        width: 31.w,
        icon: Icons.edit,
        label: "Edit Spot",
      ),
    );
  }
}
