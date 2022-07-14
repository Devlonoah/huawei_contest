import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/spacing.dart';
import '../../../../core/device_size.dart';
import '../../../bloc/theme_bloc/barrel.dart';
import 'theme_switch.dart';
import '../../../../theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EndDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  addVerticalSpace(
                    80,
                  ),
                  SettingsWidget(
                    label: "Theme",
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
        style:
            Theme.of(context).textTheme.headline6?.copyWith(fontSize: 15.0.sp),
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
