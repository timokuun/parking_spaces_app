import 'package:flutter/material.dart';

class SpotAmenityLabel extends StatelessWidget {
  final String name;
  final Color backgroundColor;
  final Color fontColor;

  SpotAmenityLabel({
    @required this.name,
    @required this.backgroundColor,
    @required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: FittedBox(
        fit: BoxFit.none,
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: fontColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
