import 'package:flutter/material.dart';

// Size Config object to get device dimensions
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenHeight;
  static double screenWidth;
  static Orientation orientation;

  // Now also accounting for default device safeArea padding
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double proportionalHeight;
  static double proportionalWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;

    // Obtain horizontal and vertical default padding
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    // Calculate proportional height and width
    proportionalHeight = (screenHeight - _safeAreaVertical) / 100;
    proportionalWidth = (screenWidth - _safeAreaHorizontal) / 100;
  }
}
