import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/presentation/bloc/theme_bloc/barrel.dart';
import 'package:huawei_contest/presentation/features/home/widgets/theme_switch.dart';

PreferredSizeWidget appBarAndSettingsButton(BuildContext context) {
  return AppBar(
    title: Text(
      'Notes',
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}


//!TODO: Switch button functionality


