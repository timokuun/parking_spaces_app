import 'package:flutter/material.dart';

class GaragePreview extends StatelessWidget {
  const GaragePreview({
    Key key,
    @required this.miles,
    @required this.availSpots,
    @required this.lowPrice,
    @required this.highPrice,
  }) : super(key: key);

  final double miles;
  final int availSpots;
  final int lowPrice;
  final int highPrice;

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          width: devWidth * 0.35,
          height: devHeight * 0.05,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              "Pangea",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: devWidth * 0.5,
          height: devHeight * 0.05,
          child: Center(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "${miles} miles • ${availSpots} spots • \$${lowPrice}-${highPrice}",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ),
        ),
        Container(
          width: devWidth * 0.15,
          height: devHeight * 0.05,
          child: Icon(
            Icons.chevron_right,
            color: Theme.of(context).iconTheme.color,
            size: 35,
          ),
        )
      ],
    );
  }
}
