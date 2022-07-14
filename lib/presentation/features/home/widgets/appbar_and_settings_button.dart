import 'package:flutter/material.dart';

PreferredSizeWidget appBarAndSettingsButton(BuildContext context,
    {void Function()? onPressed}) {
  return AppBar(
    title: Text(
      'Notty',
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(fontWeight: FontWeight.w100),
    ),
    // actions: [
    //   // IconButton(
    //   //   onPressed: onPressed,
    //   //   icon: Icon(Icons.settings_outlined),
    //   // ),
    // ],
  );
}
