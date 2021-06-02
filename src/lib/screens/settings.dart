import 'package:car_park_login/screens/login_screen.dart';
import 'package:car_park_login/widgets/general_button.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = '/test';
  final List<String> backgrounds;

  SettingsScreen({this.backgrounds});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GeneralButton(
                buttonLabel: "Logout",
                height: SizeConfig.screenHeight * 0.05,
                width: SizeConfig.screenHeight * 0.1,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
