import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

// Screens
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/active_spots_screen.dart';
import 'screens/spot_info_screen.dart';
import 'screens/register_screen.dart';

import 'screens/test_screen.dart';
import 'screens/test_screen2.dart';

import 'theme.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'theme.dart';
import 'widgets/active_spots_list.dart';
import 'widgets/active_spots_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.dark,
      theme: lightThemeData(context),
      home: MyMain(),
    );
  }
}

class MyMain extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyMain> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [HomeScreen(), ActiveSpotsScreen(), SpotInfoScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("ActiveSpots"),
        activeColorPrimary: customCyan,
        inactiveColorPrimary: CupertinoColors.white,
        iconSize: 25,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.directions_car_outlined),
        title: ("Active Spots"),
        activeColorPrimary: customCyan,
        inactiveColorPrimary: CupertinoColors.white,
        iconSize: 25,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Spot Info"),
        activeColorPrimary: customCyan,
        inactiveColorPrimary: CupertinoColors.white,
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
      // confineInSafeArea: true,
      backgroundColor: Colors.black, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.black,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}
