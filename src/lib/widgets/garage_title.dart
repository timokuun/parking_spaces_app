import 'package:flutter/material.dart';

class GarageTitle extends StatelessWidget {
  const GarageTitle({
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              "Pangea",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        Container(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "$miles miles • $availSpots spots • \$$lowPrice-$highPrice",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: 20,
          ),
          child: Icon(
            Icons.chevron_right,
            color: Theme.of(context).iconTheme.color,
            size: 20,
          ),
        )
      ],
    );
  }
}
