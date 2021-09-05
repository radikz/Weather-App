import 'package:flutter_weather/models/empty_exception.dart';
import 'package:flutter_weather/models/weather.dart';
import 'package:flutter_weather/models/woeid.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Api {

  Future<Weather> fetchData(String location) async {
    final woeid = await fetchWoeid(location);

    final url = Uri.parse(
        'https://www.metaweather.com/api/location/$woeid',
    );
    print(url);
    final response = await http.get(url);

    if (response.statusCode == 200){
      final body = json.decode(response.body);
      return Weather.fromJson(body);

      // return body.map((json) => Weather.fromJson(json)).toList();
    }
    throw Exception('Error fetching data');
  }

  Future<int> fetchWoeid(String location) async {
    final url = Uri.parse('https://www.metaweather.com/api/location/search/?query=$location');
    final response = await http.get(url);

    if (response.statusCode == 200) {

      final body = json.decode(response.body) as List;
      if (body.isEmpty) return throw EmptyException('Empty List');

      final woeid = body.map((json) => Woeid.fromJson(json)).toList().first.woeid;
      return woeid;
    }
    throw Exception('Error fetching data');
  }
}