import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/theme/theme_cubit.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DarkLightSwitch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ToggleSwitch(
          minWidth: 90.0,
          initialLabelIndex: state.status == ThemeStatus.dark ? 1 : 0,
          cornerRadius: 20.0,
          radiusStyle: true,
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.grey,
          inactiveFgColor: Colors.white,
          totalSwitches: 2,
          labels: ['Light', 'Dark'],
          icons: [Icons.wb_sunny, Icons.nightlight_round],
          activeBgColors: [
            [Colors.orange],
            [Colors.blueAccent]
          ],
          onToggle: (index) {
            index == 1
                ? context.read<ThemeCubit>().toDark()
                : context.read<ThemeCubit>().toLight();
          },
        );
      },
    );
  }
}