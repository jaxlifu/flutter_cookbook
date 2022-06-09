import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/app.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'package:flutter_weather/weather_bloc_observer.dart';
import 'package:logger/logger.dart';

final logger = Logger();

void main(List<String> args) {
  BlocOverrides.runZoned(
    () => runApp(WeatherApp(repository: WeatherRepository())),
    blocObserver: WeatherBlocObserver(),
  );
}
