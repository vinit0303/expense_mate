import 'package:expense_manager/utils/color_const.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const String poppins = 'Poppins';

  static TextStyle regular({
    required double fontSize,
    Color color = ColorConst.fontColorBlack,
    TextDecoration? textDecoration,
    double? letterSpacing,
    FontStyle fontStyle = FontStyle.normal,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: poppins,
        decoration: textDecoration,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
      );

  static TextStyle medium({
    required double fontSize,
    Color color = ColorConst.fontColorBlack,
    TextDecoration? textDecoration,
    double? height,
    double? letterSpacing,
    FontStyle fontStyle = FontStyle.normal,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: poppins,
        decoration: textDecoration,
        height: height,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
      );

  static TextStyle bold({
    required double fontSize,
    Color color = ColorConst.fontColorBlack,
    TextDecoration? textDecoration,
    double? letterSpacing,
    FontStyle fontStyle = FontStyle.normal,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w600,
        fontFamily: poppins,
        decoration: textDecoration,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
      );
  static TextStyle extrabold({
    required double fontSize,
    Color color = ColorConst.fontColorBlack,
    TextDecoration? textDecoration,
    double? letterSpacing,
    FontStyle fontStyle = FontStyle.normal,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w700,
        fontFamily: poppins,
        decoration: textDecoration,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
      );
}
