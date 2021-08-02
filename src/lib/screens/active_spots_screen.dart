import 'package:flutter/material.dart';
import '../size_config.dart';

import '../models/parking_spot.dart';
import '../widgets/active_spots_list.dart';
import '../widgets/active_spots_number_indicator.dart';

// TODO: Conditional-ize the image carousel (if no pictures)

class ActiveSpotsScreen extends StatefulWidget {
  static const String id = '/activeSpots';
  final List<ParkingSpot> userSpots;

  ActiveSpotsScreen({Key key, this.userSpots}) : super(key: key);

  @override
  _ActiveSpotsScreenState createState() => _ActiveSpotsScreenState();
}

class _ActiveSpotsScreenState extends State<ActiveSpotsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        // height: SizeConfig.screenHeight * 0.93,
        // width: SizeConfig.screenWidth,
        height: SizeConfig.proportionalHeight * 96,
        width: SizeConfig.proportionalWidth * 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActiveSpotsNumberIndicator(
              margin: EdgeInsets.only(
                // top: SizeConfig.proportionalHeight * 7.76,
                // bottom: SizeConfig.screenHeight * 0.01,
                top: SizeConfig.screenHeight * 0.075,
                bottom: SizeConfig.proportionalHeight * 1,
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
