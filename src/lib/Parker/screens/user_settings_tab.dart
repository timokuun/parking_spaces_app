import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

import '../../screens/edit_account_screen.dart';
import './manage_cars_screen.dart';

import '../../widgets/settings_tile.dart';
import '../../theme.dart';

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
              value: context.read(userInfoProvider).darkMode,
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
            // Navigate to edit account screen
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
          title: "Manage Cars",
          onTap: () {
            // Navigate to manage cars screen
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ManageCarsScreen(),
              ),
            );
          },
        ),
        SettingsTile(
          title: "Change Notification Settings",
          onTap: () {},
        ),
        SettingsTile(
          title: "View Past Rentals",
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
    );
  }
}
