import 'package:car_park_login/screens/active_spots_screen.dart';
import 'package:car_park_login/screens/home_screen.dart';
import 'package:car_park_login/screens/register_screen.dart';
import 'package:car_park_login/screens/spot_info_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/animated_text_field.dart';
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
                margin: EdgeInsets.fromLTRB(
                    0, devHeight * 0.15, 0, devHeight * 0.12),
                height: 200,
                width: 200,
                child: Text("IMAGE GOES HERE"),
              ),
              /* Login Form */
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.05),
                width: devWidth * 0.75,
                child: AnimatedTextField(
                  textNode: _userNode,
                  fieldController: username,
                  fieldLabel: "Username/Phone #",
                  isPassword: false,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.05),
                width: devWidth * 0.75,
                child: AnimatedTextField(
                  textNode: _passNode,
                  fieldController: password,
                  fieldLabel: "Password",
                  isPassword: true,
                ),
              ),
              /* Submit/Register Buttons */
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GeneralButton(
                    buttonLabel: "Register",
                    onTap: () {
                      Navigator.of(context).pushNamed(RegisterScreen.id);
                    },
                  ),
                  SizedBox(
                    width: devWidth * 0.05,
                  ),
                  GeneralButton(
                    buttonLabel: "Login",
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                //Use for navigation rn...
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneralButton(
                    buttonLabel: "Info Screen",
                    onTap: () {
                      Navigator.of(context).pushNamed(SpotInfoScreen.id);
                    },
                  ),
                  GeneralButton(
                    buttonLabel: "Active Spots",
                    onTap: () {
                      Navigator.of(context).pushNamed(ActiveSpotsScreen.id);
                    },
                  ),
                  GeneralButton(
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
