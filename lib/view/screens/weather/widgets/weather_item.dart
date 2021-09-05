import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/models/weather.dart';
import 'package:flutter_weather/utils/weather_converter.dart';

class WeatherItem extends StatelessWidget {
  WeatherItem({required this.index, required this.weather});

  final int index;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return index == 0
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            width: width * 0.5,
            child: Column(
              children: [
                Text(weather.title, style: TextStyle(fontSize: 40)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      weather.consolidatedWeather[index].theTemp.toString().substring(0, 4) + '°',
                      style: TextStyle(fontSize: 40),
                    ),
                    SvgPicture.network(
                      'https://www.metaweather.com/static/img/weather/${weather.consolidatedWeather[index].weatherStateAbbr}.svg',
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Min: \n${WeatherConverter().roundDegree(weather.consolidatedWeather[index].minTemp)}',
                          style: Theme.of(context).textTheme.subtitle1,
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                          'Max: \n${WeatherConverter().roundDegree(weather.consolidatedWeather[index].minTemp)}',
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                  ],
                )
              ],
            ),
          )
        : ListTile(
            leading: SvgPicture.network(
              'https://www.metaweather.com/static/img/weather/${weather.consolidatedWeather[index].weatherStateAbbr}.svg',
              height: 100,
              width: 80,
            ),
            title: Text(
              weather.consolidatedWeather[index].weatherStateName,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            subtitle: Text(
              WeatherConverter().dateToDay(weather.consolidatedWeather[index].applicableDate),
              style: Theme.of(context).textTheme.caption,
            ),
            trailing: Text(WeatherConverter().roundDegree(weather.consolidatedWeather[index].minTemp),
                style: Theme.of(context).textTheme.headline6),
          );
  }
}
