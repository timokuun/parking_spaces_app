import 'package:car_park_login/providers/providers.dart';
import 'package:car_park_login/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/settings_tile.dart';

import 'package:lite_rolling_switch/lite_rolling_switch.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class UserSettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 2.h),
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LiteRollingSwitch(
              value: context.read(userInfoProvider).settings.darkMode,
              textOn: 'Dark Mode',
              textOff: 'Light Mode',
              animationDuration: Duration(milliseconds: 350),
              colorOn: customBlack,
              colorOff: customCyan,
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
