import 'package:flutter/material.dart';

import 'widgets/ourWidgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Map<int, Color> cyanCodes = {
      50: Color.fromRGBO(0, 203, 203, .1),
      100: Color.fromRGBO(0, 203, 203, .2),
      200: Color.fromRGBO(0, 203, 203, .3),
      300: Color.fromRGBO(0, 203, 203, .4),
      400: Color.fromRGBO(0, 203, 203, .5),
      500: Color.fromRGBO(0, 203, 203, .6),
      600: Color.fromRGBO(0, 203, 203, .7),
      700: Color.fromRGBO(0, 203, 203, .8),
      800: Color.fromRGBO(0, 203, 203, .9),
      900: Color.fromRGBO(0, 203, 203, 1),
    };

    const MaterialColor cyanBruh = MaterialColor(0xFF00CBCB, cyanCodes);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: cyanBruh,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
                margin: EdgeInsets.fromLTRB(
                    0, devHeight * 0.15, 0, devHeight * 0.12), //.12
                height: 200,
                width: 200,
                child: Text("IMAGE GOES HERE"),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.05),
                width: devWidth * 0.75,
                child: OurTextField(
                  passNode: _userNode,
                  fieldController: username,
                  fieldLabel: "Username/Phone #",
                  isPassword: false,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, devHeight * 0.05),
                width: devWidth * 0.75,
                child: OurTextField(
                  passNode: _passNode,
                  fieldController: password,
                  fieldLabel: "Password",
                  isPassword: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OurButton(
                    devWidth: devWidth,
                    buttonLabel: "Register",
                  ),
                  SizedBox(
                    width: devWidth * 0.05,
                  ),
                  OurButton(
                    devWidth: devWidth,
                    buttonLabel: "Login",
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
