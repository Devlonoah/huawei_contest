import 'package:flutter/material.dart';

class ThemeText {
  ThemeText._();

  static ThemeData _theme = ThemeData(
    fontFamily: 'Poppins',
  );

  static TextTheme get _poppinsTheme => _theme.textTheme;
  //TextTheme to be used in ldark theme
  static TextStyle get _whiteHeadline6 =>
      _poppinsTheme.headline6!.copyWith(color: Colors.white);

  static TextStyle get _whiteHeadline3 =>
      _poppinsTheme.headline3!.copyWith(color: Colors.white);

  static TextStyle get _whiteHeadline2 =>
      _poppinsTheme.headline2!.copyWith(color: Colors.white);

//Textheme to be used in light theme
  static TextStyle get _blackHeadline6 =>
      _poppinsTheme.headline6!.copyWith(color: Colors.grey);

  static TextStyle get _blackHeadline3 =>
      _poppinsTheme.headline3!.copyWith(color: Colors.grey);

  static TextStyle get _blackHeadline2 =>
      _poppinsTheme.headline2!.copyWith(color: Colors.white);

  static getLightTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
        headline3: _whiteHeadline3,
        headline2: _whiteHeadline2,
      );

  static getDarkTextTheme() => TextTheme(
        headline6: _blackHeadline6,
        headline3: _blackHeadline3,
        headline2: _blackHeadline2,
      );
}
