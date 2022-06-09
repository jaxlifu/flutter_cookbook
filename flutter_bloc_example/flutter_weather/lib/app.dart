import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/pages/weather_page.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'package:flutter_weather/theme/cubit/theme_cubit.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({
    Key? key,
    required WeatherRepository repository,
  })  : _repository = repository,
        super(key: key);

  final WeatherRepository _repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _repository,
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: const WeatherAppView(),
      ),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: state),
          home: const WeatherPage(),
        );
      },
    );
  }
}
