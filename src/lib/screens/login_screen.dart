import 'package:flutter/material.dart';

import '../widgets/ourWidgets.dart';

// TODO: Remove Buttons row used for DEBUG navigating

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

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
                child: OurTextField(
                  textNode: _userNode,
                  fieldController: username,
                  fieldLabel: "Username/Phone #",
                  isPassword: false,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.05),
                width: devWidth * 0.75,
                child: OurTextField(
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
                  OurButton(
                    buttonLabel: "Register",
                    onTap: () {},
                  ),
                  SizedBox(
                    width: devWidth * 0.05,
                  ),
                  OurButton(
                    buttonLabel: "Login",
                    onTap: () {},
                  ),
                ],
              ),
              Row(
                children: [
                  OurButton(
                    buttonLabel: "Info Screen",
                    onTap: () {
                      Navigator.of(context).pushNamed('/spotInfo');
                    },
                  ),
                  OurButton(
                    buttonLabel: "Active Spots",
                    onTap: () {
                      Navigator.of(context).pushNamed('/activeSpots');
                    },
                  ),
                  OurButton(
                    buttonLabel: "Home page",
                    onTap: () {
                      Navigator.of(context).pushNamed('/home');
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
