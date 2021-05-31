import 'package:car_park_login/screens/spot_info_screen.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import '../theme.dart';

import '../models/parking_garage.dart';

class GaragePictures extends StatelessWidget {
  const GaragePictures({
    Key key,
    @required this.garage,
  }) : super(key: key);

  final ParkingGarage garage;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.20,
      child: ListView.builder(
        itemCount: garage.spots.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            highlightColor: customCyan,
            radius: 300,
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              print("Open parking spot info page");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SpotInfoScreen(
                    spot: garage.spots[index],
                    bought: false,
                  ),
                ),
              );
            },
            child: Container(
              width: SizeConfig.screenWidth * 0.44,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  // Only render the first picture of a spot
                  image: AssetImage(garage.spots[index].spotImages[0]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
