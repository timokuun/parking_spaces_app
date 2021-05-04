import 'package:flutter/material.dart';

class OurColor {
  static const Map<int, Color> cyanCodes = {
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

  static const MaterialColor ourCyan = MaterialColor(0xFF00CBCB, cyanCodes);
}
