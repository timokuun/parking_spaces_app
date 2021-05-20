import 'package:car_park_login/screens/active_spots_screen.dart';
import 'package:car_park_login/screens/home_screen.dart';
import 'package:car_park_login/screens/register_screen.dart';
import 'package:car_park_login/screens/spot_info_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/animated_text_field.dart';
import '../widgets/placeholder_logo.dart';
import '../widgets/general_button.dart';

// TODO: Remove Buttons row used for DEBUG navigating

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;
  static const String id = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  FocusNode _userNode;
  FocusNode _passNode;

  @override
  void initState() {
    super.initState();
    _userNode = FocusNode();
    _passNode = FocusNode();
  }

  @override
  void dispose() {
    _userNode.dispose();
    _passNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double devHeight = MediaQuery.of(context).size.height;
    double devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              /* Logo Image */
              PlaceholderImage(
                margin: EdgeInsets.fromLTRB(
                    0, devHeight * 0.15, 0, devHeight * 0.12),
              ),
              /* Login Form */
              AnimatedTextField(
                height: devHeight * 0.075,
                width: devWidth * 0.75,
                margin: EdgeInsets.only(bottom: devHeight * 0.03),
                textNode: _userNode,
                fieldController: username,
                fieldLabel: "Username/Phone #",
                isPassword: false,
              ),
              AnimatedTextField(
                height: devHeight * 0.075,
                width: devWidth * 0.75,
                margin: EdgeInsets.only(bottom: devHeight * 0.03),
                textNode: _passNode,
                fieldController: password,
                fieldLabel: "Password",
                isPassword: true,
              ),
              /* Submit/Register Buttons */
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GeneralButton(
                    buttonLabel: "Register",
                    height: devHeight * 0.055,
                    width: devWidth * 0.25,
                    margin: EdgeInsets.symmetric(horizontal: devWidth * 0.04),
                    onTap: () {
                      Navigator.of(context).pushNamed(RegisterScreen.id);
                    },
                  ),
                  GeneralButton(
                    height: devHeight * 0.055,
                    width: devWidth * 0.25,
                    margin: EdgeInsets.symmetric(horizontal: devWidth * 0.04),
                    buttonLabel: "Login",
                    onTap: () {},
                  ),
                ],
              ),
              // Using for debug navigation...
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneralButton(
                    height: devHeight * 0.055,
                    width: devWidth * 0.25,
                    buttonLabel: "Info Screen",
                    onTap: () {
                      Navigator.of(context).pushNamed(SpotInfoScreen.id);
                    },
                  ),
                  GeneralButton(
                    height: devHeight * 0.055,
                    width: devWidth * 0.25,
                    buttonLabel: "Active Spots",
                    onTap: () {
                      Navigator.of(context).pushNamed(ActiveSpotsScreen.id);
                    },
                  ),
                  GeneralButton(
                    height: devHeight * 0.055,
                    width: devWidth * 0.25,
                    buttonLabel: "Home page",
                    onTap: () {
                      Navigator.of(context).pushNamed(HomeScreen.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
