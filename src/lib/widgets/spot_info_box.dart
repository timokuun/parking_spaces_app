import 'package:flutter/material.dart';

import '../size_config.dart';
import '../models/parking_spot_v2.dart';
// import '../models/parking_spot.dart';

class SpotInfoBox extends StatelessWidget {
  // final ParkingSpot spot;
  final ParkingSpotV2 spot;

  const SpotInfoBox({
    Key key,
    @required this.spot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth * 0.8,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      margin: EdgeInsets.only(
        top: SizeConfig.screenHeight * 0.03,
        bottom: SizeConfig.screenHeight * 0.03,
      ),
      padding: EdgeInsets.only(
        bottom: SizeConfig.screenHeight * 0.03,
      ),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              "${spot.name}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.cyan,
                    size: 35,
                  ),
                  Text(
                    // TODO: Implement rating
                    spot.numRatings == 0
                        ? "No Ratings"
                        : "${spot.avgRating}(${spot.numRatings})",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: SizeConfig.screenHeight * 0.05,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1,
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
                      fontSize: 11,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${spot.height}cm",
                    style: TextStyle(
                      fontSize: 25,
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
