import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/repository/models/weather.dart'
    as repository_weather;
import 'package:flutter_weather/weather/models/weather.dart';

class ThemeCubit extends Cubit<Color> {
  static const defaultColor = Color(0xFF2196F3);

  ThemeCubit() : super(defaultColor);

  void updateTheme(Weather? weather) {
    if (weather != null) emit(weather.toColor);
  }
}

extension on Weather {
  Color get toColor {
    switch (condition) {
      case repository_weather.WeatherCondition.clear:
        return Colors.orangeAccent;
      case repository_weather.WeatherCondition.snowy:
        return Colors.lightBlueAccent;
      case repository_weather.WeatherCondition.cloudy:
        return Colors.blueGrey;
      case repository_weather.WeatherCondition.rainy:
        return Colors.indigoAccent;
      case repository_weather.WeatherCondition.unknown:
      default:
        return ThemeCubit.defaultColor;
    }
  }
}
