import 'package:flutter/material.dart';
import './garage_pictures.dart';
import './garage_title.dart';
import '../models/parkingSpot.dart';

class GarageResult extends StatelessWidget {
  /* Properties */
  final double miles;
  final int availableSpots;
  final int lowPrice;
  final int highPrice;
  final ParkingGarage garage;

  GarageResult(
      {this.miles,
      this.availableSpots,
      this.lowPrice,
      this.highPrice,
      this.garage});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        children: [
          GarageTitle(
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
