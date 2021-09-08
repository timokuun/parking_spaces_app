import '../../providers/parking_spots_resultsV2.dart';
import 'package:flutter/material.dart';

// import '../../models/parking_spot.dart';
import '../../models/parking_spot_v2.dart';
import '../widgets/active_spots_list.dart';
import '../widgets/active_spots_number_indicator.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

// TODO: Conditional-ize the image carousel (if no pictures)

class ActiveSpotsScreen extends StatefulWidget {
  static const String id = '/activeSpots';
  // final List<ParkingSpot> userSpots;
  final List<ParkingSpotV2> userSpots;

  ActiveSpotsScreen({Key key, this.userSpots}) : super(key: key);

  @override
  _ActiveSpotsScreenState createState() => _ActiveSpotsScreenState();
}

class _ActiveSpotsScreenState extends State<ActiveSpotsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: 93.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActiveSpotsNumberIndicator(
              margin: EdgeInsets.only(
                top: 7.5.h,
                bottom: 1.h,
              ),
            ),
            ActiveSpotsList(
              userSpots: widget.userSpots,
            ),
          ],
        ),
      ),
    );
  }
}
