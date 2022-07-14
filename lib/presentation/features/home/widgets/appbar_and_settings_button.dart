import 'package:flutter/material.dart';

PreferredSizeWidget appBarAndSettingsButton(BuildContext context,
    {void Function()? onPressed}) {
  return AppBar(
    title: Text(
      '',
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.settings_outlined),
      ),
    ],
  );
}
