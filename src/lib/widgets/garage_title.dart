import 'package:car_park_login/models/parking_garage.dart';
import 'package:car_park_login/screens/garage_spots_screen.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import '../theme.dart';

class GarageTitle extends StatelessWidget {
  const GarageTitle({
    Key key,
    @required this.garage,
    @required this.miles,
    @required this.availSpots,
    @required this.lowPrice,
    @required this.highPrice,
  }) : super(key: key);

  final ParkingGarage garage;
  final double miles;
  final int availSpots;
  final int lowPrice;
  final int highPrice;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      radius: 500,
      splashColor: customCyan,
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        print("Opened garage page");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GarageSpotsScreen(garage: garage),
          ),
        );
      },
      child: Container(
        height: SizeConfig.screenHeight * 0.04,
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //TODO: Make tappable garage title taller?
              width: SizeConfig.screenWidth * 0.3,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "${garage.name}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
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
        ),
      ),
    );
  }
}
