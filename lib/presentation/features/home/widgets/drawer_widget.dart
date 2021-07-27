import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_contest/core/device_size.dart';
import 'package:huawei_contest/presentation/bloc/theme_bloc/barrel.dart';
import 'package:huawei_contest/presentation/features/home/widgets/theme_switch.dart';
import 'package:huawei_contest/theme/theme.dart';

class EndDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kkDrawerBackGroundColoor,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: DS.sh * 0.03),
                  ListTile(
                    leading: Text(
                      'Change Theme ',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Theme.of(context).primaryColorDark),
                    ),
                    trailing: BlocBuilder<ThemeBloc, ThemeState>(
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
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: DS.sh * 0.05,
              width: double.infinity,
              color: Colors.grey,
              child: Text('2021'),
            )
          ],
        ),
      ),
    );
  }
}
