import 'package:equatable/equatable.dart';
import 'package:flutter_weather/repository/models/weather.dart'
    as repository_weather;

enum TemperatureUnits {
  fahrenheit,
  celsius;

  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

class Temperature extends Equatable {
  final double value;

  const Temperature({required this.value});

  @override
  List<Object?> get props => [value];
}

class Weather extends Equatable {
  final repository_weather.WeatherCondition condition;
  final DateTime lastUpdated;
  final String location;
  final Temperature temperature;

  const Weather({
    required this.condition,
    required this.lastUpdated,
    required this.location,
    required this.temperature,
  });

  @override
  List<Object?> get props => [condition, lastUpdated, location, temperature];

  Weather copyWith({
    repository_weather.WeatherCondition? condition,
    DateTime? lastUpdated,
    String? location,
    Temperature? temperature,
  }) =>
      Weather(
        condition: condition ?? this.condition,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        location: location ?? this.location,
        temperature: temperature ?? this.temperature,
      );

  static final empty = Weather(
    condition: repository_weather.WeatherCondition.unknown,
    lastUpdated: DateTime.now(),
    location: '--',
    temperature: const Temperature(value: 0.0),
  );

  factory Weather.fromRepository(repository_weather.Weather weather) => Weather(
        condition: weather.condition,
        lastUpdated: DateTime.now(),
        location: weather.location,
        temperature: Temperature(value: weather.temperature),
      );
}
