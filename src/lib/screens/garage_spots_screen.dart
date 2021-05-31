import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "${widget.garage.name}",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
