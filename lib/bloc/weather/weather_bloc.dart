import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather/models/empty_exception.dart';
import 'package:flutter_weather/utils/api.dart';
import 'package:flutter_weather/models/weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is WeatherFetched) {
      yield state.copyWith(status: WeatherStatus.loading);
      yield await _mapWeatherToState(state, event.search);
    }
  }

  Future<WeatherState> _mapWeatherToState(WeatherState state, String search) async {
    try {
      final weather = await Api().fetchData(search);
      return state.copyWith(
          status: WeatherStatus.success,
          data: weather
      );
    } on EmptyException {
      return state.copyWith(
          status: WeatherStatus.empty,
          data: null
      );
    } on Exception {
      return state.copyWith(
        status: WeatherStatus.failure
      );
    }
  }
}
