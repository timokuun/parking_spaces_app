import 'package:flutter/material.dart';

import '../models/parkingSpot.dart';

class GaragePictures extends StatelessWidget {
  const GaragePictures({
    Key key,
    @required this.garage,
  }) : super(key: key);

  final ParkingGarage garage;

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;
    return Container(
      height: devHeight * 0.21,
      child: ListView.builder(
        itemCount: garage.spots.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: devWidth * 0.45,
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
          );
        },
      ),
    );
  }
}
