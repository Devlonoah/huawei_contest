import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  ThemeState({this.themeData, this.currentValue});
  final ThemeData? themeData;
  final bool? currentValue;
  @override
  List<Object> get props => [
        themeData!,
        currentValue!,
      ];
}
