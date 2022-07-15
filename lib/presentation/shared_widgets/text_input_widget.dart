import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huawei_contest/theme/colors.dart';

// ignore: must_be_immutable
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
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      maxLines: null,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      cursorWidth: 3,
      cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
      style: TextStyle(
        color: Theme.of(context).textTheme.headline1?.color,
        fontSize: isTitle ? 14 : 18,
        letterSpacing: 0.1,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        isDense: isTitle ? false : true,
        hintText: hint,
        counter: SizedBox.shrink(),
        hintStyle: TextStyle(
            color: qqGrey.withOpacity(0.5), fontSize: isTitle ? 14 : 16),
        border: InputBorder.none,
      ),
    );
  }
}
