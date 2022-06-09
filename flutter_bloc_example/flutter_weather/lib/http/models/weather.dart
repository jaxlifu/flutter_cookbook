// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

Weather weatherFromJson(String str) => Weather.fromJson(jsonDecode(str));

String weatherToJson(Weather data) => jsonEncode(data.toJson());

class Weather {
  Weather({
    required this.airPressure,
    required this.applicableDate,
    required this.created,
    required this.humidity,
    required this.id,
    required this.maxTemp,
    required this.minTemp,
    required this.predictability,
    required this.theTemp,
    required this.visibility,
    required this.weatherState,
    required this.weatherStateName,
    required this.windDirection,
    required this.windDirectionCompass,
    required this.windSpeed,
  });

  final int airPressure;
  final DateTime applicableDate;
  final String created;
  final int humidity;
  final int id;
  final double maxTemp;
  final double minTemp;
  final int predictability;
  final double theTemp;
  final double visibility;
  final WeatherState weatherState;
  final String weatherStateName;
  final double windDirection;
  final WindDirection windDirectionCompass;
  final double windSpeed;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        airPressure: json["air_pressure"],
        applicableDate:
            DateFormat('yyyy-MM-dd HH:mm:ss').parse(json["applicable_date"]),
        created: json["created"],
        humidity: json["humidity"],
        id: json["id"],
        maxTemp: json["max_temp"].toDouble(),
        minTemp: json["min_temp"].toDouble(),
        predictability: json["predictability"],
        theTemp: json["the_temp"].toDouble(),
        visibility: json["visibility"].toDouble(),
        weatherState: WeatherState.fronString(json['weather_state_abbr']),
        weatherStateName: json["weather_state_name"],
        windDirection: json["wind_direction"].toDouble(),
        windDirectionCompass:
            WindDirection.fronString(json["wind_direction_compass"]),
        windSpeed: json["wind_speed"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "air_pressure": airPressure,
        "applicable_date": applicableDate.toIso8601String(),
        "created": created,
        "humidity": humidity,
        "id": id,
        "max_temp": maxTemp,
        "min_temp": minTemp,
        "predictability": predictability,
        "the_temp": theTemp,
        "visibility": visibility,
        "weather_state_abbr": weatherState.source,
        "weather_state_name": weatherStateName,
        "wind_direction": windDirection,
        "wind_direction_compass": windDirectionCompass.source,
        "wind_speed": windSpeed,
      };
}

enum WeatherState {
  snow('sn'),
  sleet('sl'),
  hail('h'),
  thunderstorm('t'),
  heavyRain('hr'),
  lightRain('lr'),
  showers('s'),
  heavyCloud('hc'),
  lightCloud('lc'),
  clear('c'),
  unknown('');

  final String source;

  const WeatherState(this.source);

  factory WeatherState.fronString(String from) =>
      values.firstWhere((item) => item.source == from);
}

enum WindDirection {
  north('N'),
  northEast('NE'),
  east('E'),
  southEast('SE'),
  south('S'),
  southWest('SW'),
  west('W'),
  northWest('NW'),
  unknown('');

  final String source;

  const WindDirection(this.source);

  factory WindDirection.fronString(String from) =>
      values.firstWhere((item) => item.source == from);
}
