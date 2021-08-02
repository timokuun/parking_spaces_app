import 'package:flutter/material.dart';

import '../theme.dart';
import './user_settings_tab.dart';
import './user_favorites_tab.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

// Handles which app mode the user is in
enum AppModes { parker, spacer }

class UserScreen extends StatefulWidget {
  static const String id = '/settings';

  @override
  _UserScreenState createState() => _UserScreenState();
}

// TODO: Toggle for mode currently on button only, not whole user info area

// SingleTickerProviderStateMixin used to assist animation controller of the tab
class _UserScreenState extends State<UserScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var appMode = AppModes.parker;

  @override
  void initState() {
    super.initState();

    // Set number of tabs and use the ticker of this class
    _tabController = TabController(length: 3, vsync: this);
  }

  void _toggleAppMode() {
    setState(() {
      appMode == AppModes.parker
          ? appMode = AppModes.spacer
          : appMode = AppModes.parker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: customBlack,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),

                // TODO: Use actual user profile image
                child: CircleAvatar(
                  backgroundColor: customCyan,
                  // radius: 50,
                  radius: 34.sp,
                ),
              ),

              // Displayed username
              Text(
                "Jonathon",
                style: TextStyle(
                    // fontSize: 32,
                    fontSize: 22.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),

              // Toggler between app modes
              TextButton.icon(
                onPressed: () => _toggleAppMode(),
                icon: Icon(
                  appMode == AppModes.parker
                      ? Icons.directions_car_outlined
                      : Icons.assignment,
                  color: Colors.white,
                  // size: 24,
                  size: 17.sp,
                ),
                label: Text(
                  appMode == AppModes.parker ? "Parker" : "Spacer",
                  style: TextStyle(
                    // fontSize: 16,
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),

              // Color the tabBar
              Container(
                margin: EdgeInsets.only(
                  // top: 10,
                  top: 1.h,
                ),
                color: customBlack,
                child: TabBar(
                  unselectedLabelColor: Colors.white,
                  labelStyle: TextStyle(
                    // fontSize: 18,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w800,
                  ),
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    borderRadius: BorderRadius.circular(8.sp),
                    color: customCyan,
                  ),
                  tabs: [
                    Tab(text: 'TBD'),
                    Tab(text: 'Favorites'),
                    Tab(text: 'Settings'),
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  // indicatorPadding:
                  //     EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  indicatorPadding:
                      EdgeInsets.symmetric(vertical: 5.sp, horizontal: 12.sp),
                ),
              ),

              // Page view takes up rest of the space below the tabs
              Expanded(
                // Contains pages for each tab
                child: TabBarView(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: customBlack,
                      child: Center(child: Text("TBD")),
                    ),
                    UserFavoritesTab(),
                    UserSettingsTab(),
                  ],
                  controller: _tabController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
