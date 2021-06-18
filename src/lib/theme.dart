import 'package:flutter/material.dart';

const Color customCyan = Color.fromRGBO(0, 203, 203, 1);
const Color customBlack = Color.fromRGBO(20, 20, 20, 1);

// TODO: Set up light and dark themes to our likings later...

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: customCyan,
    iconTheme: IconThemeData(color: Colors.white),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    backgroundColor: customBlack,
    primaryColor: customCyan,
    iconTheme: IconThemeData(color: Colors.white),
  );
}
