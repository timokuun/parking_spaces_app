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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
                margin: EdgeInsets.fromLTRB(
                    0, devHeight * 0.09, 0, devHeight * 0.09),
                height: 200,
                width: 200,
                child: Text("IMAGE GOES HERE"),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.025),
                width: devWidth * 0.75,
                child: AnimatedTextField(
                  textNode: _phoneNode,
                  fieldController: pNum,
                  fieldLabel: "Phone #",
                  isPassword: false,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.025),
                width: devWidth * 0.75,
                child: AnimatedTextField(
                  textNode: _emailNode,
                  fieldController: username,
                  fieldLabel: "Email",
                  isPassword: false,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.025),
                width: devWidth * 0.75,
                child: AnimatedTextField(
                  textNode: _userNode,
                  fieldController: email,
                  fieldLabel: "Username",
                  isPassword: false,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.025),
                width: devWidth * 0.75,
                child: AnimatedTextField(
                  textNode: _passNode,
                  fieldController: password,
                  fieldLabel: "Password",
                  isPassword: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GeneralButton(
                    buttonLabel:
                        "Register", // TODO: Connect with the backend for user creation
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
