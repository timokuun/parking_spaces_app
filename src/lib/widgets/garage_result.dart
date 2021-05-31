import 'package:flutter/material.dart';

import './garage_pictures.dart';
import './garage_title.dart';
import '../models/parking_garage.dart';

class GarageResult extends StatelessWidget {
  /* Properties */

  final double miles;
  final int availableSpots;
  final int lowPrice;
  final int highPrice;
  final ParkingGarage garage;

  GarageResult({
    @required this.miles,
    @required this.availableSpots,
    @required this.lowPrice,
    @required this.highPrice,
    @required this.garage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        children: [
          GarageTitle(
              garage: garage,
              miles: miles,
              availSpots: availableSpots,
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
