import 'package:flutter_weather/http/meta_weather_api.dart';
import 'package:flutter_weather/http/models/weather.dart' as http_weather;
import 'package:flutter_weather/repository/models/weather.dart';

class WeatherRepository {
  final MetaWeatherApiClient _weatherApiClient;

  WeatherRepository({MetaWeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? MetaWeatherApiClient();

  Future<Weather> getWeather(String city) async {
    final location = await _weatherApiClient.locationSearch(city);
    final weather = await _weatherApiClient.getWeather(location.woeid);
    return Weather(
      location: location.title,
      temperature: weather.theTemp,
      condition: weather.weatherState.toCondition,
    );
  }
}

extension on http_weather.WeatherState {
  WeatherCondition get toCondition {
    switch (this) {
      case http_weather.WeatherState.clear:
        return WeatherCondition.clear;
      case http_weather.WeatherState.snow:
      case http_weather.WeatherState.sleet:
      case http_weather.WeatherState.hail:
        return WeatherCondition.snowy;
      case http_weather.WeatherState.thunderstorm:
      case http_weather.WeatherState.heavyRain:
      case http_weather.WeatherState.lightRain:
      case http_weather.WeatherState.showers:
        return WeatherCondition.rainy;
      case http_weather.WeatherState.heavyCloud:
      case http_weather.WeatherState.lightCloud:
        return WeatherCondition.cloudy;
      default:
        return WeatherCondition.unknown;
    }
  }
}
