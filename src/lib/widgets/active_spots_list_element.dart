import 'package:flutter/material.dart';

import '../models/parking_spot.dart';

class ActiveSpotsListElement extends StatelessWidget {
  const ActiveSpotsListElement({
    Key key,
    @required this.buildIndex,
    this.margin,
    @required this.timeLeft,
  }) : super(key: key);

  final int buildIndex;
  final EdgeInsetsGeometry margin;
  final String timeLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          "${spots[buildIndex].name}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Rent Time: $timeLeft",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
