import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeSwitch extends StatelessWidget {
  final Function(bool)? onChanged;
  final bool value;

  const ThemeSwitch({Key? key, this.onChanged, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Switch(value: value, onChanged: onChanged)
        : CupertinoSwitch(value: value, onChanged: onChanged);
  }
}
