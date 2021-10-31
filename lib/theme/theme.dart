import 'package:flutter/material.dart';
import 'colors.dart';

Color? textColor;
ThemeData lightThemeData() {
  textColor = Colors.black;
  return ThemeData.dark().copyWith(
    primaryColor: Color(0xFF94a2b2),
    backgroundColor: Color(0xFF94a2b2),
    scaffoldBackgroundColor: Color(0xFFebf3fb),
    cardColor: Color(0xFF94a2b2),
    inputDecorationTheme: InputDecorationTheme(),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      headline2: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      headline3: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      headline4: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      headline5: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      headline6: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      subtitle1: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      subtitle2: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      bodyText1: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      bodyText2: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      button: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      caption: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
      overline: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
    ),
    iconTheme: IconThemeData(color: Colors.black54),
    appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF94a2b2),
        brightness: Brightness.light,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black)),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith(
        (x) => Colors.black,
      ),
      trackColor: MaterialStateColor.resolveWith((x) => Colors.black),
      splashRadius: 15.0,
      overlayColor: MaterialStateColor.resolveWith(
        (x) => Colors.grey,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.black,
    ),
  );
}

ThemeData darkThemeData() {
  textColor = Colors.white;
  return ThemeData.dark().copyWith(
    primaryColor: Colors.grey[900],
    backgroundColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.grey.shade800,
    iconTheme: IconThemeData(color: Colors.grey),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.amber),
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      headline2: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      headline3: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      headline4: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      headline5: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      headline6: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      subtitle1: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      subtitle2: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      button: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      caption: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      overline: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: qqBlack,
        brightness: Brightness.dark,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white)),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith(
        (x) => Colors.white,
      ),
      trackColor: MaterialStateColor.resolveWith((x) => Colors.white),
      splashRadius: 15.0,
      overlayColor: MaterialStateColor.resolveWith(
        (x) => Colors.white60,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.amber.shade700,
      foregroundColor: Colors.white,
    ),
  );
}

final Color kkDefaultIconColor = Colors.white;
