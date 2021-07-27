import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeSwitch extends StatelessWidget {
  final Function(bool)? onChanged;
  final bool value;

  const ThemeSwitch({Key? key, this.onChanged, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return ToggleSwitch(
    //   minWidth: DS.sw * 0.1,
    //   minHeight: DS.sh * 0.05,
    //   initialLabelIndex: 0,
    //   cornerRadius: 20.0,
    //   activeFgColor: Colors.grey,
    //   inactiveBgColor: Colors.grey,
    //   inactiveFgColor: Colors.white,
    //   totalSwitches: 2,
    //   icons: [
    //     FontAwesomeIcons.cloudMoon,
    //     FontAwesomeIcons.solidMoon,
    //   ],
    //   iconSize: 30.0,
    //   activeBgColors: [
    //     [Colors.black45, Colors.black],
    //     [qqYellow, Colors.red]
    //   ],

    //   animate:
    //       false, // with just animate set to true, default curve = Curves.easeIn
    //   curve: Curves
    //       .bounceInOut, // animate must be set to true when using custom curve
    //   onToggle: (index) {
    //     BlocProvider.of<ThemeBloc>(context)..add(ThemeChangedEvent(index));
    //   },
    // );

    return CupertinoSwitch(value: value, onChanged: onChanged);
  }
}
