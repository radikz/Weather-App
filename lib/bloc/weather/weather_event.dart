part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class WeatherFetched extends WeatherEvent {
  final String search;

  WeatherFetched({required this.search});
}
