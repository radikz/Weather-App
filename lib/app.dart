import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/theme/theme_cubit.dart';
import 'package:flutter_weather/view/screens/home/home_page.dart';
import 'bloc/weather/weather_bloc.dart';
import 'view/screens/weather/weather_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => ThemeCubit()),
          BlocProvider(create: (ctx) => WeatherBloc()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
              theme: state.status == ThemeStatus.light ? ThemeData.light() : ThemeData.dark(),
              routes: {
                WeatherPage.routeName: (ctx) => WeatherPage(),
              },
            );
          },
        ));
  }
}
