import 'package:flutter/material.dart';

import '../size_config.dart';
import 'main_router.dart';
import './register_screen.dart';
import '../widgets/animated_text_field.dart';
import '../widgets/placeholder_logo.dart';
import '../widgets/general_button.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/login';
  final String title;

  LoginPage({Key key, this.title}) : super(key: key);

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
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              /* Logo Image */
              PlaceholderImage(
                margin: EdgeInsets.only(
                  // top: SizeConfig.screenHeight * 0.15,
                  // bottom: SizeConfig.screenHeight * 0.12,
                  top: 15.h,
                  bottom: 12.h,
                ),
              ),
              /* Login Form */
              AnimatedTextField(
                // height: SizeConfig.screenHeight * 0.075,
                // width: SizeConfig.screenWidth * 0.75,
                height: 7.h,
                width: 75.w,
                // margin: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.03),
                margin: EdgeInsets.only(bottom: 3.h),
                textNode: _userNode,
                fieldController: username,
                fieldLabel: "Username/Phone #",
                isPassword: false,
              ),
              AnimatedTextField(
                // height: SizeConfig.screenHeight * 0.075,
                // width: SizeConfig.screenWidth * 0.75,
                height: 7.h,
                width: 75.w,
                // margin: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.03),
                margin: EdgeInsets.only(bottom: 3.h),
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
                    // height: SizeConfig.screenHeight * 0.055,
                    // width: SizeConfig.screenWidth * 0.25,
                    height: 5.h,
                    width: 22.w,
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: SizeConfig.screenWidth * 0.04),
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
                    // height: SizeConfig.screenHeight * 0.055,
                    // width: SizeConfig.screenWidth * 0.25,
                    height: 5.h,
                    width: 22.w,
                    // margin: EdgeInsets.symmetric(
                    //     horizontal: SizeConfig.screenWidth * 0.04),
                    margin: EdgeInsets.symmetric(horizontal: 3.h),
                    buttonLabel: "Login",
                    onTap: () {
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
      ),
    );
  }
}
