import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/active_spots_list.dart';
import '../widgets/active_spots_number_indicator.dart';

// TODO: Conditional-ize the image carousel (if no pictures)

class ActiveSpotsScreen extends StatefulWidget {
  ActiveSpotsScreen({Key key, this.title}) : super(key: key);

  final String title;
  static const String id = '/activeSpots';

  @override
  _ActiveSpotsScreenState createState() => _ActiveSpotsScreenState();
}

class _ActiveSpotsScreenState extends State<ActiveSpotsScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          ActiveSpotsNumberIndicator(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              top: deviceHeight * 0.075,
              bottom: deviceHeight * 0.01,
            ),
          ),
          ActiveSpotsList(),
        ],
      ),
    );
  }
}
