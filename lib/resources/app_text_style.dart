import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  // Base default style (can be modified)
  static const TextStyle _defaultStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle customText({
    Color? color,
    Paint? foreground,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    double fontSize = 12,
    double? height,
  }) {
    return _defaultStyle.copyWith(
      fontSize: fontSize,
      color: color ?? _defaultStyle.color,
      foreground: foreground,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle customText10({
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    double? height,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 10,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle customText12({
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    double? height,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 12,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle customText14({
    Color? color,
    double? height,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    TextDecoration decoration = TextDecoration.none,
    Color? decorationColor,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 14,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      decoration: decoration,
      height: height,
      decorationColor: decorationColor,
    );
  }

  static TextStyle customText16({
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    double? height,
    TextDecoration decoration = TextDecoration.none,
    Color? decorationColor,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 16,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      decoration: decoration,
      decorationColor: decorationColor,
      height: height,
    );
  }

  static TextStyle customText18({
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    double? height,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 18,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle customText20({
    Color? color,
    double? height,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 20,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle customText22({
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    double? height,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 22,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle customText24({
    double? height,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 24,
      height: height,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle customText26({
    Color? color,
    double? height,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 26,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle customText28({
    Color? color,
    double? height,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 28,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle customText32({
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    TextDecoration decoration = TextDecoration.none,
    double? height,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 32,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      decoration: decoration,
      height: height,
    );
  }

  static TextStyle customText38({
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    TextDecoration decoration = TextDecoration.none,
    double? height,
  }) {
    return _defaultStyle.copyWith(
      fontSize: 38,
      fontWeight: fontWeight,
      color: color ?? _defaultStyle.color,
      letterSpacing: letterSpacing,
      decoration: decoration,
      height: height,
    );
  }

  static TextStyle customTextPoppins({
    Color? color,
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
    );
  }



  static TextStyle customTextBlackMango({
    Color? color,
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    double? height,
    TextDecoration decoration = TextDecoration.none,
    Color? decorationColor,
  }) {
    return TextStyle(
      fontFamily: "BlackMango",
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }
}