import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double deviceRatio;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  static double safeAreaHeight;
  static double oneThirdOfScreenHeight;
  static double oneThirdOfScreenWidth;
  static double halfOfScreenHeight;
  static double halfOfScreenWidth;
  static double quarterOfScreenHeight;
  static double quarterOfScreenWidth;
  static double sixthQuarterOfScreenHeight;
  static double sixthQuarterOfScreenWidth;
  static double eightQuarterOfScreenHeight;
  static double eightQuarterOfScreenWidth;
  static double tenPercentOfScreenHeight;
  static double tenPercentOfScreenWidth;

  static double devicePixelRatio = ui.window.devicePixelRatio;
  static ui.Size size = ui.window.physicalSize;
  static double actualWidth = size.width;
  static double actualHeight = size.height;
  static double smallestDimension;

  static bool isPhone;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    deviceRatio = screenWidth / screenHeight;
    smallestDimension = MediaQuery.of(context).size.shortestSide;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    safeAreaHeight = screenHeight - _safeAreaVertical;
    oneThirdOfScreenHeight = screenHeight / 3;
    oneThirdOfScreenWidth = screenWidth / 3;
    halfOfScreenHeight = screenHeight / 2;
    halfOfScreenWidth = screenWidth / 2;
    quarterOfScreenHeight = screenHeight / 4;
    quarterOfScreenWidth = screenWidth / 4;
    sixthQuarterOfScreenHeight = screenHeight / 6;
    sixthQuarterOfScreenWidth = screenWidth / 6;
    eightQuarterOfScreenHeight = screenHeight / 8;
    eightQuarterOfScreenWidth = screenWidth / 8;
    tenPercentOfScreenHeight = screenHeight / 10;
    tenPercentOfScreenWidth = screenWidth / 10;

    isPhone = smallestDimension < 600;

  }
}