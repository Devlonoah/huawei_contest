import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  TextInputWidget(
      {Key? key,
      required this.isTitle,
      required this.onChanged,
      this.hint,
      this.controller,
      required this.autoFocus})
      : super(key: key);

  final bool isTitle;
  final String? hint;
  late bool autoFocus;
  void Function(String)? onChanged;

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      controller: controller,
      onChanged: onChanged,
      maxLength: isTitle ? 20 : 1000,
      maxLines: isTitle ? 1 : 1000,
      style: TextStyle(
          color: Theme.of(context).textTheme.headline1?.color,
          fontSize: 20.0,
          fontFamily: 'Monaco'),
      decoration: InputDecoration(hintText: hint),
    );
  }
}
