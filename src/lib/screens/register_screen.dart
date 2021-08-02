import 'package:flutter/material.dart';

import '../size_config.dart';
import 'main_router.dart';
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
                  // top: SizeConfig.screenHeight * 0.15,
                  // bottom: SizeConfig.screenHeight * 0.09,
                  top: 15.h,
                  bottom: 9.h,
                ),
              ),
              AnimatedTextField(
                // height: SizeConfig.screenHeight * 0.075,
                // width: SizeConfig.screenWidth * 0.75,
                // margin: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.02),
                height: 7.h,
                width: 75.w,
                margin: EdgeInsets.only(bottom: 2.h),
                textNode: _phoneNode,
                fieldController: pNum,
                fieldLabel: "Phone #",
                isPassword: false,
              ),
              AnimatedTextField(
                // height: SizeConfig.screenHeight * 0.075,
                // width: SizeConfig.screenWidth * 0.75,
                // margin: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.02),
                height: 7.h,
                width: 75.w,
                margin: EdgeInsets.only(bottom: 2.h),
                textNode: _emailNode,
                fieldController: email,
                fieldLabel: "Email",
                isPassword: false,
              ),
              AnimatedTextField(
                // height: SizeConfig.screenHeight * 0.075,
                // width: SizeConfig.screenWidth * 0.75,
                // margin: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.02),
                height: 7.h,
                width: 75.w,
                margin: EdgeInsets.only(bottom: 2.h),
                textNode: _userNode,
                fieldController: username,
                fieldLabel: "Username",
                isPassword: false,
              ),
              AnimatedTextField(
                // height: SizeConfig.screenHeight * 0.075,
                // width: SizeConfig.screenWidth * 0.75,
                // margin: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.02),
                height: 7.h,
                width: 75.w,
                margin: EdgeInsets.only(bottom: 2.h),
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
                    // height: SizeConfig.screenHeight * 0.055,
                    // width: SizeConfig.screenWidth * 0.25,
                    height: 5.h,
                    width: 22.w,
                    onTap: () {
                      // TODO: set up with backend later
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
