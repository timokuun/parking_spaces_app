import 'package:flutter/material.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

const Color customCyan = Color.fromRGBO(0, 203, 203, 1);
const Color customBlack = Color.fromRGBO(20, 20, 20, 1);
const Color customWhite = Color.fromRGBO(225, 225, 225, 1);

// TODO: Set up light and dark themes to our likings later...

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    backgroundColor: customWhite,
    primaryColor: customCyan,
    accentColor: customBlack,
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline1: TextStyle(
          color: Colors.black, fontSize: 28.sp, fontWeight: FontWeight.w800),
      headline2: TextStyle(
          color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.w800),
      headline3: TextStyle(color: Colors.black, fontSize: 12.5.sp),
      subtitle1: TextStyle(color: Colors.black, fontSize: 9.sp),
    ),
    iconTheme: IconThemeData(color: Colors.white),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    backgroundColor: customBlack,
    primaryColor: customCyan,
    accentColor: customWhite,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline1: TextStyle(
          color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.w800),
      headline2: TextStyle(
          color: Colors.white, fontSize: 22.sp, fontWeight: FontWeight.w800),
      headline3: TextStyle(color: Colors.white, fontSize: 12.5.sp),
      subtitle1: TextStyle(color: Colors.white, fontSize: 9.sp),
    ),
    iconTheme: IconThemeData(color: Colors.white),
  );
}
