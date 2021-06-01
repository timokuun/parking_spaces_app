import 'package:car_park_login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'theme.dart';

// Screens
import 'screens/test_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.dark,
      theme: lightThemeData(context),
      routes: {
        TestScreen.id: (context) => TestScreen(),
      },
      home: LoginPage(),
    );
  }
}
