// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(jsonDecode(str));

String locationToJson(Location data) => jsonEncode(data.toJson());

class Location {
  Location({
    required this.lattLong,
    required this.locationType,
    required this.title,
    required this.woeid,
  });

  String lattLong;
  LocationType locationType;
  String title;
  int woeid;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lattLong: json["latt_long"],
        locationType: LocationType.fromString(json["location_type"]),
        title: json["title"],
        woeid: json["woeid"],
      );

  Map<String, dynamic> toJson() => {
        "latt_long": lattLong,
        "location_type": locationType.source,
        "title": title,
        "woeid": woeid,
      };

  List<String> get latitudeLongitude => lattLong.split(',');

  String get latitude =>
      latitudeLongitude.isNotEmpty ? latitudeLongitude[0] : '';

  String get longitude =>
      latitudeLongitude.length > 1 ? latitudeLongitude[1] : '';
}

enum LocationType {
  CITY,
  REGION,
  STATE,
  PROVINCE,
  COUNTRY,
  CONTINENT;

  String get source => name.length > 1
      ? '${name[0].toUpperCase()}${name.substring(1, name.length).toLowerCase()}'
      : name;

  factory LocationType.fromString(String from) =>
      values.singleWhere((item) => item.source == from);
}
