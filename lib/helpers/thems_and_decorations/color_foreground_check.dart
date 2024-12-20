import 'dart:math';

import 'package:flutter/material.dart';

bool useWhiteForeground(Color backgroundColor, {double bias = 0.0}) {
  // Old:
  // return 1.05 / (color.computeLuminance() + 0.05) > 4.5;

  // New:
  int v = sqrt(pow(backgroundColor.red, 2) * 0.299 +
      pow(backgroundColor.green, 2) * 0.587 +
      pow(backgroundColor.blue, 2) * 0.114)
      .round();
  return v < 130 + bias ? true : false;
}


Color getColorFromHex(String hexColor) {
  try{
    final hexCode = hexColor.replaceAll('#', '');
    if (hexCode.length == 6) {
      // For RGB color codes
      return Color(int.parse('FF$hexCode', radix: 16));
    } else if (hexCode.length == 8) {
      // For ARGB color codes
      return Color(int.parse(hexCode, radix: 16));
    } else {
      return Colors.transparent;
    }
  }
  catch(e){
    return Colors.transparent;
  }

}

