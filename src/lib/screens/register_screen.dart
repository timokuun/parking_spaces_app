import 'package:car_park_login/screens/home_screen.dart';
import 'package:car_park_login/widgets/placeholder_logo.dart';
import 'package:flutter/material.dart';

import '../widgets/animated_text_field.dart';
import '../widgets/general_button.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key, this.title}) : super(key: key);

  final String title;
  static const String id = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final pNum = TextEditingController();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  FocusNode _phoneNode;
  FocusNode _emailNode;
  FocusNode _userNode;
  FocusNode _passNode;

  @override
  void initState() {
    super.initState();
    _phoneNode = FocusNode();
    _emailNode = FocusNode();
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
              PlaceholderImage(
                margin: EdgeInsets.fromLTRB(
                    0, devHeight * 0.15, 0, devHeight * 0.09),
              ),
              AnimatedTextField(
                height: devHeight * 0.075,
                width: devWidth * 0.75,
                margin: EdgeInsets.only(bottom: devHeight * 0.02),
                textNode: _phoneNode,
                fieldController: pNum,
                fieldLabel: "Phone #",
                isPassword: false,
              ),
              AnimatedTextField(
                height: devHeight * 0.075,
                width: devWidth * 0.75,
                margin: EdgeInsets.only(bottom: devHeight * 0.02),
                textNode: _emailNode,
                fieldController: email,
                fieldLabel: "Email",
                isPassword: false,
              ),
              AnimatedTextField(
                height: devHeight * 0.075,
                width: devWidth * 0.75,
                margin: EdgeInsets.only(bottom: devHeight * 0.02),
                textNode: _userNode,
                fieldController: username,
                fieldLabel: "Username",
                isPassword: false,
              ),
              AnimatedTextField(
                height: devHeight * 0.075,
                width: devWidth * 0.75,
                margin: EdgeInsets.only(bottom: devHeight * 0.02),
                textNode: _passNode,
                fieldController: password,
                fieldLabel: "Password",
                isPassword: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GeneralButton(
                    buttonLabel: "Register",
                    height: devHeight * 0.055,
                    width: devWidth * 0.25,
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
