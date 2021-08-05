import 'package:car_park_login/theme.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import '../widgets/settings_tile.dart';

import 'package:lite_rolling_switch/lite_rolling_switch.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class UserSettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LiteRollingSwitch(
                value: true,
                textOn: 'Dark Mode',
                textOff: 'Light Mode',
                animationDuration: Duration(milliseconds: 350),
                colorOn: customBlack,
                colorOff: customCyan,
                iconOn: Icons.brightness_2,
                iconOff: Icons.brightness_5,
                textSize: 9.sp,
                onChanged: (bool state) {
                  print('Current State of SWITCH IS: $state');
                },
              ),
            ],
          ),
        ),
        SettingsTile(
          title: "Edit Account",
          subtitle: "Change username, password, etc...",
        ),
        SettingsTile(
          title: "Manage Payment Methods",
        ),
        SettingsTile(
          title: "Manage Cars",
        ),
        SettingsTile(
          title: "Change Notification Settings",
        ),
        SettingsTile(
          title: "View Past Rentals",
        ),
        SettingsTile(
          title: "Provide Feedback",
        ),
        SettingsTile(
          title: "Report In-App Bugs",
        ),
      ],
    );
  }
}
