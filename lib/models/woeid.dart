// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'dart:convert';

List<Woeid> locationFromJson(String str) => List<Woeid>.from(json.decode(str).map((x) => Woeid.fromJson(x)));

String locationToJson(List<Woeid> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Woeid {
  Woeid({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });

  final String title;
  final String locationType;
  final int woeid;
  final String lattLong;

  factory Woeid.fromJson(Map<String, dynamic> json) => Woeid(
    title: json["title"],
    locationType: json["location_type"],
    woeid: json["woeid"],
    lattLong: json["latt_long"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "location_type": locationType,
    "woeid": woeid,
    "latt_long": lattLong,
  };
}
