import 'package:car_park_login/widgets/query_result.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../theme.dart';
import 'home_screen.dart';
import 'settings.dart';
import 'active_spots_screen.dart';
import 'spot_info_screen.dart';
import '../models/parking_spot.dart';

class MainRouter extends StatefulWidget {
  static const String id = '/main';

  @override
  _MainRouterState createState() => _MainRouterState();
}

class _MainRouterState extends State<MainRouter> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      ActiveSpotsScreen(
        userSpots: spots,
      ),
      SpotInfoScreen(
        spot: spots[0],
        bought: false,
      ),
      SettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("ActiveSpots"),
        activeColorPrimary: customCyan,
        inactiveColorPrimary: Colors.white,
        iconSize: 25,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.directions_car_outlined),
        title: ("Active Spots"),
        activeColorPrimary: customCyan,
        inactiveColorPrimary: Colors.white,
        iconSize: 25,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.info),
        title: ("Spot Info"),
        activeColorPrimary: customCyan,
        inactiveColorPrimary: Colors.white,
        iconSize: 25,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Profile"),
        activeColorPrimary: customCyan,
        inactiveColorPrimary: Colors.white,
        iconSize: 25,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: customBlack,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.black,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
