import 'package:flutter/material.dart';


Color _getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  return Color(int.parse('FF' + hexColor, radix: 16));
}
Color appOrange = _getColorFromHex("FF7403");
Color appBlack = _getColorFromHex("000000");
Color appWhite = _getColorFromHex("fffbf7");