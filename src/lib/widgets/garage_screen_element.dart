import 'package:flutter/material.dart';

import '../size_config.dart';
import '../theme.dart';
import '../screens/spot_info_screen.dart';
import '../models/parking_spot.dart';

class GarageScreenElement extends StatelessWidget {
  final ParkingSpot spot;

  const GarageScreenElement({
    Key key,
    @required this.spot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: customCyan,
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpotInfoScreen(
              spot: spot,
              bought: false,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.44,
              height: SizeConfig.screenHeight * 0.2,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 0.5,
                    offset: Offset(0, 0.25),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    spot.spotImages[0],
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              spot.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              "${spot.maxHeight}cm • \$${spot.price}/hr",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
