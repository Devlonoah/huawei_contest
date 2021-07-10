import 'package:flutter/material.dart';
import 'package:huawei_contest/theme/colors.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: qqWhite,
  cardColor: qqBlue,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: qqBlue),
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: qqBlack,
  cardColor: qqCardColor,
  textTheme: TextTheme(),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: qqBlue,
    foregroundColor: qqBlue,
  ),
);
