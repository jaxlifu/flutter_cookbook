part of 'weather_cubit.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

class WeatherState extends Equatable {
  WeatherState({
    this.status = WeatherStatus.initial,
    this.temperatureUnits = TemperatureUnits.celsius,
    Weather? weather,
  }) : weather = weather ?? Weather.empty;

  final WeatherStatus status;
  final Weather weather;
  final TemperatureUnits temperatureUnits;

  @override
  List<Object> get props => [status, weather, temperatureUnits];

  WeatherState copyWith({
    WeatherStatus? status,
    TemperatureUnits? temperatureUnits,
    Weather? weather,
  }) =>
      WeatherState(
        status: status ?? this.status,
        temperatureUnits: temperatureUnits ?? this.temperatureUnits,
        weather: weather ?? this.weather,
      );
}
