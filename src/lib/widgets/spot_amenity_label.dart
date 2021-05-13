import 'package:flutter/material.dart';

class SpotAmenityLabel extends StatelessWidget {
  const SpotAmenityLabel({
    Key key,
    @required this.devHeight,
    @required this.devWidth,
    @required this.backgroundColor,
    @required this.fontColor,
  }) : super(key: key);

  final double devHeight;
  final double devWidth;
  final Color backgroundColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: devHeight * 0.045,
      width: devWidth * 0.25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          "Night Lights",
          style: TextStyle(
              color: fontColor, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
