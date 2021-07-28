import 'package:flutter/material.dart';
import 'package:huawei_contest/theme/colors.dart';

ThemeData lightThemeData() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.grey[400],
    backgroundColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.white60,
    cardColor: Color(0xFFC6C6D1),
    inputDecorationTheme: InputDecorationTheme(),
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
        backgroundColor: Color(0xFFC6C6D1),
        brightness: Brightness.light,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black)),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith(
        (x) => Colors.red,
      ),
      trackColor: MaterialStateColor.resolveWith((x) => Colors.blue),
      splashRadius: 30.0,
      overlayColor: MaterialStateColor.resolveWith(
        (x) => Colors.red,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrangeAccent.shade700,
      foregroundColor: Colors.black,
    ),
  );
}

ThemeData darkThemeData() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.grey[900],
    backgroundColor: Colors.blueGrey,
    scaffoldBackgroundColor: qqBlack,
    cardColor: Colors.blueGrey.shade900,
    iconTheme: IconThemeData(color: Colors.grey),
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
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrangeAccent.shade700,
      foregroundColor: Colors.black,
    ),
  );
}

final Color kkDefaultIconColor = Colors.white;
