import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color transparent = Color(0xFF00000000);

  static const Color Primarycolor = Color(0xFF224289);
  static const Color DarkPrimarycolor = Color(0xFF152b79);
  static const Color lightPrimarycolor = Color(0xFF1454f2);
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFFF0000);
  static const Color gradientGreen = Color(0xff2DC52A);

// ! Text Colors
  static const Color DarkText = Color(0xFF0e255b);
  static const Color greenishText = Color(0xFF21a886);
  static const Color greyText = Color(0xFF939dac);
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
