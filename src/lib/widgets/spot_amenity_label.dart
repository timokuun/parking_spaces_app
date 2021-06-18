import 'package:flutter/material.dart';

class SpotAmenityLabel extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color fontColor;

  const SpotAmenityLabel({
    Key key,
    @required this.name,
    @required this.height,
    @required this.width,
    @required this.backgroundColor,
    @required this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
