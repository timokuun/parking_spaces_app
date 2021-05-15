import 'package:car_park_login/screens/register_screen.dart';
import 'package:flutter/material.dart';

/* Screens */
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/active_spots_screen.dart';
import 'screens/spot_info_screen.dart';

import 'package:flutter/services.dart';

/* Models */
import './models/Color.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.transparent,
  //     statusBarColor: Color.fromRGBO(0, 0, 0, 0), // transparent status bar
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          LoginPage.id, // TODO: NEED CND FOR AUTH: Sign-in vs home page
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ActiveSpotsScreen.id: (context) => ActiveSpotsScreen(),
        SpotInfoScreen.id: (context) => SpotInfoScreen(),
      },
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        primarySwatch: OurColor.ourCyan,
      ),
      home: LoginPage(), // TODO: NEED CONDITIONAL FOR AUTH: Sign-in vs Log-in
    );
  }
}
