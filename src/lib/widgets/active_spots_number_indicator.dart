import 'package:flutter/material.dart';

import '../models/parkingSpot.dart';

class ActiveSpotsNumberIndicator extends StatelessWidget {
  const ActiveSpotsNumberIndicator({
    Key key,
    this.margin,
    this.padding,
  }) : super(key: key);

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "${spots.length} Active Spots",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
