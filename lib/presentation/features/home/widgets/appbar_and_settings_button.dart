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
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.info_outline),
        ),
      ),
    ],
  );
}
