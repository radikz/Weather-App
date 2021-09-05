import 'package:intl/intl.dart';

class WeatherConverter{

  bool sameDateWeatherNow(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final now = formatter.format(DateTime.now());
    final weatherDate = formatter.format(date);
    return weatherDate == now;
  }

  String roundDegree(double degree) =>
      '${degree.toString().substring(0, 4)}°';

  String dateToDay(DateTime date) =>
      DateFormat('EEEE').format(date);

}