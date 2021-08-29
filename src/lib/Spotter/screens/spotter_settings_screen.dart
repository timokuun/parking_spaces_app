import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:sizer/sizer.dart';

import '../../providers/providers.dart';

import '../../screens/edit_account_screen.dart';

import '../../widgets/settings_tile.dart';
import '../../theme.dart';

// Handles which app mode the user is in
enum AppModes { parker, spacer }

class SpotterSettingsScreen extends StatefulWidget {
  @override
  _SpotterSettingsScreenState createState() => _SpotterSettingsScreenState();
}

class _SpotterSettingsScreenState extends State<SpotterSettingsScreen> {
  var appMode = AppModes.parker;

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
          width: double.infinity,
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),

                // TODO: Use actual user profile image
                child: CircleAvatar(
                  backgroundColor: customCyan,
                  radius: 34.sp,
                ),
              ),

              // Displayed username
              Text(
                "Jonathon",
                style: Theme.of(context).textTheme.headline2,
              ),

              // Toggler between app modes
              TextButton.icon(
                onPressed: () => _toggleAppMode(),
                icon: Icon(
                  appMode == AppModes.parker
                      ? Icons.directions_car_outlined
                      : Icons.assignment,
                  color: Theme.of(context).accentColor,
                  size: 17.sp,
                ),
                label: Text(
                  appMode == AppModes.parker ? "Parker" : "Spacer",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),

              // Settings Header
              Container(
                padding: EdgeInsets.only(left: 3.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Settings",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),

              // List of settings
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 2.h),
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LiteRollingSwitch(
                          value:
                              context.read(userInfoProvider).settings.darkMode,
                          textOn: 'Dark Mode',
                          textOff: 'Light Mode',
                          animationDuration: Duration(milliseconds: 350),
                          colorOn: Theme.of(context).backgroundColor,
                          colorOff: Theme.of(context).primaryColor,
                          iconOn: Icons.brightness_2,
                          iconOff: Icons.brightness_5,
                          textSize: 9.sp,
                          onChanged: (bool mode) {
                            context.read(userInfoProvider).toggleDarkMode(mode);
                          },
                        ),
                      ],
                    ),
                    SettingsTile(
                      title: "Edit Account",
                      subtitle: "Change username, password, etc...",
                      onTap: () {
                        // Navigate to edit account page
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditAccountScreen(),
                          ),
                        );
                      },
                    ),
                    SettingsTile(
                      title: "Manage Payment Methods",
                      onTap: () {},
                    ),
                    SettingsTile(
                      title: "Change Notification Settings",
                      onTap: () {},
                    ),
                    SettingsTile(
                      title: "Provide Feedback",
                      onTap: () {},
                    ),
                    SettingsTile(
                      title: "Report In-App Bugs",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
