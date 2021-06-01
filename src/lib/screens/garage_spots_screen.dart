import 'package:car_park_login/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

import '../screens/spot_info_screen.dart';
import '../models/parking_garage.dart';

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
        backgroundColor: Colors.black,
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
              height: SizeConfig.screenHeight * 0.84,
              child: GridView.count(
                crossAxisSpacing: 15,
                mainAxisSpacing: 25,
                childAspectRatio: 0.85,
                crossAxisCount: 2,
                children: widget.garage.spots.map((spot) {
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
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
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
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${spot.maxHeight}cm • \$${spot.price}/hr",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
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
