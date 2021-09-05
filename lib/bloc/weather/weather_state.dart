part of 'weather_bloc.dart';

enum WeatherStatus { loading, success, failure, empty }

class WeatherState {
  const WeatherState({this.status = WeatherStatus.loading, this.data});

  final WeatherStatus status;
  final Weather? data;

  WeatherState copyWith({WeatherStatus? status, Weather? data}) {
    return WeatherState(status: status ?? this.status, data: data ?? this.data);
  }

  @override
  String toString() {
    return ''' Weather State: status $status ''';
  }
}
