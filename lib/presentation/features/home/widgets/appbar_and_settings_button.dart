import 'package:flutter/material.dart';

PreferredSizeWidget appBarAndSettingsButton(BuildContext context) {
  return AppBar(
    title: Text(
      'Notty',
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
