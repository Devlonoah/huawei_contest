import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/theme/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ThemeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: DS.sw * 0.1,
      minHeight: DS.sh * 0.05,
      initialLabelIndex: 0,
      cornerRadius: 20.0,
      activeFgColor: Colors.grey,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      icons: [
        FontAwesomeIcons.cloudMoon,
        FontAwesomeIcons.solidMoon,
      ],
      iconSize: 30.0,
      activeBgColors: [
        [Colors.black45, Colors.black],
        [qqYellow, Colors.red]
      ],

      animate:
          true, // with just animate set to true, default curve = Curves.easeIn
      curve: Curves
          .bounceInOut, // animate must be set to true when using custom curve
      onToggle: (index) {
        print('switched to: $index');
      },
    );
  }
}
