import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import '../theme.dart';

import '../models/parking_garage.dart';
import '../widgets/garage_screen_element.dart';

class GarageSpotsScreen extends StatefulWidget {
  GarageSpotsScreen({@required this.garage});

  final ParkingGarage garage;
  @override
  _GarageSpotsScreenState createState() => _GarageSpotsScreenState();
}

class _GarageSpotsScreenState extends State<GarageSpotsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: customBlack,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "${widget.garage.name}",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 5,
              ),
              height: SizeConfig.screenHeight * 0.815,
              child: GridView.count(
                crossAxisSpacing: 15,
                mainAxisSpacing: 25,
                childAspectRatio: SizeConfig.screenWidth * 0.0019, // 0.85
                crossAxisCount: 2,
                children: widget.garage.spots.map((spot) {
                  return GarageScreenElement(
                    spot: spot,
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
