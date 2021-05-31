import 'package:flutter/material.dart';

import '../models/parking_spot.dart';
import '../screens/spot_info_screen.dart';

class ActiveSpotsListElement extends StatelessWidget {
  const ActiveSpotsListElement({
    Key key,
    @required this.spot,
    @required this.buildIndex,
    @required this.timeLeft,
    this.margin,
  }) : super(key: key);

  final ParkingSpot spot;
  final int buildIndex;
  final EdgeInsetsGeometry margin;
  final String timeLeft;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpotInfoScreen(
              spot: spot,
              bought: true,
            ),
          ),
        );
      },
      child: Container(
        margin: margin,
        child: ListTile(
          tileColor: Colors.black,
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text(
                  "$buildIndex",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            "${spot.name}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Current Rent Time: $timeLeft",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
