import 'package:car_park_login/theme.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import '../widgets/settings_tile.dart';

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
              Container(
                color: Colors.white,
                width: SizeConfig.screenWidth * 0.23,
                height: SizeConfig.screenHeight * 0.08,
                child: Center(
                  child: Text(
                    "Light Mode",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                color: customBlack,
                width: SizeConfig.screenWidth * 0.23,
                height: SizeConfig.screenHeight * 0.08,
                child: Center(
                  child: Text(
                    "Dark Mode",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
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
