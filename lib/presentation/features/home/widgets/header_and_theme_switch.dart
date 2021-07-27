import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/presentation/bloc/theme_bloc/barrel.dart';
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
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              if (state is ThemeState) {
                return ThemeSwitch(
                  value: state.currentValue!,
                  onChanged: (value) {
                    BlocProvider.of<ThemeBloc>(context)
                      ..add(ThemeChangedEvent(value));
                  },
                );
              }

              return ThemeSwitch(
                value: false,
                onChanged: (value) {
                  BlocProvider.of<ThemeBloc>(context)
                    ..add(ThemeChangedEvent(value));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
