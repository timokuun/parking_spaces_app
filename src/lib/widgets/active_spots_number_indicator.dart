import 'package:flutter/material.dart';

class ActiveSpotsNumberIndicator extends StatelessWidget {
  const ActiveSpotsNumberIndicator({
    Key key,
    this.numSpots,
    this.margin,
    this.padding,
  }) : super(key: key);

  final int numSpots;
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
        "$numSpots Active Spots",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
