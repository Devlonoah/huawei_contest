import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/device_size.dart';
import '../../../bloc/theme_bloc/barrel.dart';
import 'theme_switch.dart';
import '../../../../theme/theme.dart';

class EndDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: DS.sh * 0.03),
                  _header(context),
                  SettingsWidget(
                    label: "Use Dark theme",
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
                  ),
                  Spacer(),
                  SettingsWidget(
                      label: 'About App',
                      trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios,
                              color: kkDefaultIconColor),
                          onPressed: () {})),
                  CustomSpaceContainer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return SizedBox(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Settings',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white),
        ),
      ),
    ));
  }
}

class SettingsWidget extends StatelessWidget {
  final String? label;
  final Widget? trailing;

  const SettingsWidget({
    Key? key,
    this.label,
    required this.trailing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        label!,
        style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 18.0),
      ),
      trailing: trailing ?? SizedBox.shrink(),
    );
  }
}

class CustomSpaceContainer extends StatelessWidget {
  const CustomSpaceContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DS.sh * 0.02,
      width: double.infinity,
      color: Colors.grey[300],
    );
  }
}
