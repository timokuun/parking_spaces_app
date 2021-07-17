import 'package:flutter/material.dart';

import '../size_config.dart';
import './main_router.dart';
import '../widgets/placeholder_logo.dart';
import '../widgets/animated_text_field.dart';
import '../widgets/general_button.dart';

// TODO: Adjust the validator functions for textfields

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
              Hero(
                tag: "logo",
                child: PlaceholderImage(
                  margin: EdgeInsets.only(
                    top: SizeConfig.screenHeight * 0.15,
                    bottom: SizeConfig.screenHeight * 0.06,
                  ),
                ),
              ),
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: _form,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AnimatedTextField(
                        width: SizeConfig.screenWidth * 0.75,
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.screenHeight * 0.02),
                        textNode: _phoneNode,
                        fieldController: _phoneCtrl,
                        fieldLabel: "Phone #",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.number,
                        validator: (input) {
                          if (input.isEmpty || input.length < 7)
                            return "Please enter a valid phone number.";
                          return null;
                        },
                      ),
                      AnimatedTextField(
                        width: SizeConfig.screenWidth * 0.75,
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.screenHeight * 0.02),
                        textNode: _emailNode,
                        fieldController: _emailCtrl,
                        fieldLabel: "Email",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        validator: (input) {
                          if (input.isEmpty || !input.contains("@"))
                            return "Please enter a valid email.";
                          return null;
                        },
                      ),
                      AnimatedTextField(
                        width: SizeConfig.screenWidth * 0.75,
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.screenHeight * 0.02),
                        textNode: _userNode,
                        fieldController: _usernameCtrl,
                        fieldLabel: "Username",
                        textInputAction: TextInputAction.next,
                        validator: (input) {
                          if (input.isEmpty) return "Please enter a username.";
                          return null;
                        },
                      ),
                      AnimatedTextField(
                        width: SizeConfig.screenWidth * 0.75,
                        margin: EdgeInsets.only(
                            bottom: SizeConfig.screenHeight * 0.02),
                        textNode: _passNode,
                        fieldController: _passwordCtrl,
                        fieldLabel: "Password",
                        isPassword: true,
                        textInputAction: TextInputAction.done,
                        validator: (input) {
                          if (input.isEmpty)
                            return "Please enter a valid password";
                          return null;
                        },
                        onSubmit: (input) => _register(),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GeneralButton(
                    buttonLabel: "Register",
                    height: SizeConfig.screenHeight * 0.055,
                    width: SizeConfig.screenWidth * 0.25,
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
