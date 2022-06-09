import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/pages/search_page.dart';
import 'package:flutter_weather/pages/settings_page.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'package:flutter_weather/theme/cubit/theme_cubit.dart';
import 'package:flutter_weather/weather/cubit/weather_cubit.dart';
import 'package:flutter_weather/weather/widgets/weather_empty.dart';
import 'package:flutter_weather/weather/widgets/weather_error.dart';
import 'package:flutter_weather/weather/widgets/weather_loading.dart';
import 'package:flutter_weather/weather/widgets/weather_populated.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text('Flutter Weather'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              SettingsPage.route(context.read<WeatherCubit>()),
            ),
            icon: const Icon(Icons.settings),
          )
        ],
      );

  Widget _buildContent() => Center(
        child: BlocConsumer<WeatherCubit, WeatherState>(
          builder: (context, state) {
            switch (state.status) {
              case WeatherStatus.initial:
                return const WeatherEmpty();
              case WeatherStatus.loading:
                return const WeatherLoading();
              case WeatherStatus.success:
                return WeatherPopulated(
                  weather: state.weather,
                  units: state.temperatureUnits,
                  onRefresh: () {
                    return context.read<WeatherCubit>().refreshWeather();
                  },
                );
              case WeatherStatus.failure:
              default:
                return const WeatherError();
            }
          },
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.read<ThemeCubit>().updateTheme(state.weather);
            }
          },
        ),
      );

  FloatingActionButton _buildFloatingActionButton(BuildContext context) =>
      FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () async {
          final String? city =
              await Navigator.push(context, SearchPage.route());
          if (!mounted) {
            return;
          }
          await context.read<WeatherCubit>().fetchWeather(city);
        },
      );
}
