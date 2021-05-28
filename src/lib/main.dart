import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Screens
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/active_spots_screen.dart';
import 'screens/spot_info_screen.dart';
import 'screens/register_screen.dart';

import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light),
  );
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
      themeMode: ThemeMode.dark,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: LoginPage(), // TODO: NEED CONDITIONAL FOR AUTH: Sign-in vs Log-in
    );
  }
}
