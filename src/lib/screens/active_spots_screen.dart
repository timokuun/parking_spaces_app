import 'package:car_park_login/screens/home_screen.dart';
import 'package:car_park_login/screens/login_screen.dart';
import 'package:car_park_login/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/spotsList.dart';

// TODO: Conditional-ize the image carousel (if no pictures)

class ActiveSpotsScreen extends StatefulWidget {
  ActiveSpotsScreen({Key key, this.title}) : super(key: key);

  final String title;
  static const String id = '/activeSpots';

  @override
  _ActiveSpotsScreenState createState() => _ActiveSpotsScreenState();
}

class _ActiveSpotsScreenState extends State<ActiveSpotsScreen> {
  // final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  // int _currIndex = 2;

  // _changePage(int index) {
  //   switch (index) {
  //     case 0:
  //       _navigatorKey.currentState.pushNamed(HomeScreen.id);
  //       break;
  //     case 1:
  //       _navigatorKey.currentState.pushNamed(ActiveSpotsScreen.id);
  //       break;
  //     case 2:
  //       _navigatorKey.currentState.pushNamed(LoginPage.id);
  //       break;
  //     case 3:
  //       _navigatorKey.currentState.pushNamed(RegisterScreen.id);
  //       break;
  //   }
  //   setState(() {
  //     _currIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(
              0,
              deviceHeight * 0.05,
              0,
              deviceHeight * 0.01,
            ), // 0.01
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "6 Active Spots",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SpotsList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // onTap: _changePage(_currIndex),
        showUnselectedLabels: true,
        selectedItemColor: Colors.cyan,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: FaIcon(FontAwesomeIcons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.car),
            label: "Parked",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userCircle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
