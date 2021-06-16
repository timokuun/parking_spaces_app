import 'package:car_park_login/theme.dart';
import 'package:flutter/material.dart';

import './garage_pictures.dart';
import './garage_title.dart';
import '../models/parking_garage.dart';

class GarageResult extends StatelessWidget {
  /* Properties */

  final double miles;

  final int lowPrice;
  final int highPrice;
  final ParkingGarage garage;

  GarageResult({
    @required this.miles,
    @required this.lowPrice,
    @required this.highPrice,
    @required this.garage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: customBlack,
      child: Column(
        children: [
          GarageTitle(
              garage: garage,
              miles: miles,
              lowPrice: lowPrice,
              highPrice: highPrice),
          GaragePictures(
            garage: garage,
          ),
        ],
      ),
    );
  }
}
