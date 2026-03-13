
import 'dart:ui';
import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  static const Color primary = Color(0xff0079FF);
  static const Color secondaryWhite = Color(0xffFFFFFF);
  
  //!   text Color :
  static const Color lightTextColor = Color(0xFF777E90);
  static const Color textGreyColor = Color(0xFFAAAAAA);

  static const Color textDarkColor = Color(0xff000000);
  static const Color textLightBlack = Color(0xFF888888);
  static const Color textwhiteColor = Color(0xffFFFFFF);

  static const Color secondaryBlack = Color(0xff1B1C1E);
  static Color lightBgButtonColor = Color(0xfff5f5f5).withOpacity(0.05);
  static const Color white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const Color positiveGreen = Color(0xff21D575);
  static const Color negativeRed = Color(0xffEA4334);
  static const Color transparent = Colors.transparent;
  static const Color bgColor = Color(0xFFF0F1F6);
  static const Color darkBgColor = Color(0xFF1B1C1E);
  static const Color borderColor = Color(0xFFE6E7E9);
  static const Color borderGrey = Color(0xFFD7DDE5);
}