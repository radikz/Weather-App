import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather/view/screens/weather/widgets/weather_item.dart';

class WeatherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        switch(state.status){
          case WeatherStatus.success:
            return ListView.separated(
              itemCount: state.data!.consolidatedWeather.length,
              itemBuilder: (context, index) => WeatherItem(index: index, weather: state.data!,),
              separatorBuilder: (context, _) => SizedBox(height: 20,),
            );
          case WeatherStatus.failure:
            return Center(child: Text('Failed to fetch post'));
          case WeatherStatus.empty:
            return Center(child: Text('Sorry, there is no result'),);
          default:
            return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}

