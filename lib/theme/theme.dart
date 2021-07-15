import 'package:flutter/material.dart';
import 'package:huawei_contest/theme/colors.dart';
import 'package:huawei_contest/theme/theme.text.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: qqWhite,
  cardColor: qqBlue,
  textTheme: ThemeText.getDarkTextTheme(),
  buttonTheme: ButtonThemeData(buttonColor: qqBlue),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: qqBlue),
);

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: qqBlack,
  cardColor: qqCardColor,
  textTheme: ThemeText.getLightTextTheme(),
  buttonTheme: ButtonThemeData(buttonColor: qqBlue),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: qqBlue,
    foregroundColor: qqBlue,
  ),
);
