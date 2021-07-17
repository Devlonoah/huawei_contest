import 'package:flutter/material.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/presentation/features/home/widgets/theme_switch.dart';

class HeaderAndThemeSwitch extends StatelessWidget {
  const HeaderAndThemeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DS.sw * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          ThemeSwitch(),
        ],
      ),
    );
  }
}
