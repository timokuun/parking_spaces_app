import 'package:car_park_login/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* Routers */
import '../Parker/main_router.dart';

import './register_screen.dart';
import '../widgets/animated_text_field.dart';
import '../widgets/placeholder_logo.dart';
import '../widgets/general_button.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final FocusNode _userNode = FocusNode();
  final FocusNode _passNode = FocusNode();
  final _form = GlobalKey<FormState>();
  String _username;
  String _password;

  void _signIn() {
    // Save current data in text fields
    _form.currentState.save();

    // Check if input is valid
    final isValid = _form.currentState.validate();
    if (!isValid) return;

    // TODO: Sign the user in with "username" and "password"
  }

  @override
  void dispose() {
    super.dispose();
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    _userNode.dispose();
    _passNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /* Logo Image */
            Hero(
              tag: "logo",
              child: PlaceholderImage(
                margin: EdgeInsets.only(
                  top: 15.h,
                  bottom: 12.h,
                ),
              ),
            ),
            /* Login Form */
            AnimatedTextField(
              width: 75.w,
              margin: EdgeInsets.only(bottom: 3.h),
              textNode: _userNode,
              fieldController: _usernameCtrl,
              fieldLabel: "Username/Phone #",
              isPassword: false,
            ),
            AnimatedTextField(
              width: 75.w,
              margin: EdgeInsets.only(bottom: 3.h),
              textNode: _passNode,
              fieldController: _passwordCtrl,
              fieldLabel: "Password",
              isPassword: true,
            ),
            /* Submit/Register Buttons */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GeneralButton(
                  buttonLabel: "Register",
                  height: 5.h,
                  width: 22.w,
                  margin: EdgeInsets.symmetric(horizontal: 3.h),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                ),
                GeneralButton(
                  height: 5.h,
                  width: 22.w,
                  margin: EdgeInsets.symmetric(horizontal: 3.h),
                  buttonLabel: "Login",
                  onTap: () {
                    // Set fake user token for now
                    // TODO: Set up backend auth
                    // context.read(userInfoProvider).userSignIn("test");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainRouter(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
