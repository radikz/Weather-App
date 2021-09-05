import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather/view/screens/weather/weather_page.dart';
import 'package:flutter_weather/view/widgets/dark_light_switch.dart';
import 'package:flutter_weather/view/widgets/search.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Weather',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                SizedBox(height: 20,),
                Search(
                  onFieldSubmitted: (value) {
                    BlocProvider.of<WeatherBloc>(context, listen: false).add(WeatherFetched(search: value));
                    Navigator.of(context).pushNamed(WeatherPage.routeName, arguments: value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: DarkLightSwitch(),
    );
  }
}
