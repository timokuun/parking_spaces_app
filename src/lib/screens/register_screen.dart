import 'package:flutter/material.dart';

import '../size_config.dart';
import './main_router.dart';
import '../widgets/placeholder_logo.dart';
import '../widgets/animated_text_field.dart';
import '../widgets/general_button.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = '/register';
  final String title;

  RegisterScreen({Key key, this.title}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _userNode = FocusNode();
  final FocusNode _phoneNode = FocusNode();
  final FocusNode _passNode = FocusNode();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    _userNode.dispose();
    _passNode.dispose();
    _phoneNode.dispose();
    _passNode.dispose();
  }

  void _register() {
    // Save current data in text fields
    _form.currentState.save();

    // Check if input is valid
    final isValid = _form.currentState.validate();

    if (!isValid) return;

    // TODO: Register the user
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              PlaceholderImage(
                margin: EdgeInsets.only(
                  top: 15.h,
                  bottom: 9.h,
                ),
              ),
              AnimatedTextField(
                width: 75.w,
                margin: EdgeInsets.only(bottom: 2.h),
                textNode: _phoneNode,
                fieldController: _phoneCtrl,
                fieldLabel: "Phone #",
                isPassword: false,
              ),
              AnimatedTextField(
                width: 75.w,
                margin: EdgeInsets.only(bottom: 2.h),
                textNode: _emailNode,
                fieldController: _emailCtrl,
                fieldLabel: "Email",
                isPassword: false,
              ),
              AnimatedTextField(
                width: 75.w,
                margin: EdgeInsets.only(bottom: 2.h),
                textNode: _userNode,
                fieldController: _usernameCtrl,
                fieldLabel: "Username",
                isPassword: false,
              ),
              AnimatedTextField(
                // height: 7.h,
                width: 75.w,
                margin: EdgeInsets.only(bottom: 2.h),
                textNode: _passNode,
                fieldController: _passwordCtrl,
                fieldLabel: "Password",
                isPassword: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GeneralButton(
                    buttonLabel: "Register",
                    height: 5.h,
                    width: 22.w,
                    onTap: () {
                      // TODO: Connect with backend later
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainRouter(),
                        ),
                      );
                    },
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
