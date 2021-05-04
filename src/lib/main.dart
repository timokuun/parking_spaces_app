import 'package:car_park_login/screens/register_screen.dart';
import 'package:flutter/material.dart';

/* Widgets */
import 'widgets/ourWidgets.dart';

/* Screens */
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/active_spots_screen.dart';
import 'screens/spot_info_screen.dart';

/* Models */
import './models/Color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // TODO: NEED CND FOR AUTH: Sign-in vs home page
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/activeSpots': (context) => ActiveSpotsScreen(),
        '/spotInfo': (context) => SpotInfoScreen(),
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