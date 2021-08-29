import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../theme.dart';
import 'screens/spot_listings_screen.dart';
import 'screens/spotter_settings_screen.dart';

// import '../models/parking_spot.dart';
import '../../models/parking_spot_v2.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class SpotterRouter extends StatefulWidget {
  static const String id = '/main';

  @override
  _SpotterRouterState createState() => _SpotterRouterState();
}

class _SpotterRouterState extends State<SpotterRouter> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      SpotListingsScreen(),
      SpotterSettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.assignment_outlined),
        title: ("SpotListings"),
        activeColorPrimary: customCyan,
        inactiveColorPrimary: Theme.of(context).accentColor.withOpacity(0.5),
        iconSize: 20.sp,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Second"),
        activeColorPrimary: customCyan,
        inactiveColorPrimary: Theme.of(context).accentColor.withOpacity(0.5),
        iconSize: 20.sp,
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
      backgroundColor: Theme.of(context).backgroundColor,
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
