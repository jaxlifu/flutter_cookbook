import 'package:equatable/equatable.dart';

enum WeatherCondition {
  clear('☀️'),
  rainy('🌧️'),
  cloudy('☁️'),
  snowy('🌨️'),
  unknown('❓');

  const WeatherCondition(this.emoji);

  final String emoji;
}

class Weather extends Equatable {
  final String location;
  final double temperature;
  final WeatherCondition condition;

  const Weather({
    required this.location,
    required this.temperature,
    required this.condition,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
