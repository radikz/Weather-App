import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather/view/screens/weather/widgets/weather_list.dart';
import 'package:flutter_weather/view/widgets/dark_light_switch.dart';
import 'package:flutter_weather/view/widgets/search.dart';

class WeatherPage extends StatelessWidget {
  static const routeName = "/weather";

  @override
  Widget build(BuildContext context) {
    final search = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: appBar(context),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Search(
                  initialValue: search,
                  onFieldSubmitted: (value) {
                    BlocProvider.of<WeatherBloc>(context, listen: false)
                        .add(WeatherFetched(search: value));
                  },
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: WeatherList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Weather',
          style: Theme.of(context).textTheme.headline6,
        ),
        DarkLightSwitch(),
      ],
    );
  }
}
