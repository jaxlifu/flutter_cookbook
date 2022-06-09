import 'package:flutter_weather/http/models/location.dart';
import 'package:flutter_weather/http/models/weather.dart';
import 'package:flutter_weather/main.dart';
import 'package:http/http.dart' as http;

class MetaWeatherApiClient {
  final http.Client _httpClient;

  static const _baseUrl = 'mock.apifox.cn';
  static const _defaultUrl = '/m1/1097647-0-default';

  MetaWeatherApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<Location> locationSearch(String query) async {
    final uri = Uri.https(
        _baseUrl, '$_defaultUrl/api/location/search/', {'query': query});
    final response = await _httpClient.get(uri);
    if (response.statusCode != 200) {
      throw Exception('locationSearch failed!');
    }
    logger.d('[${uri.toString()}] => ${response.body}');
    return locationFromJson(response.body);
  }

  Future<Weather> getWeather(int locationId) async {
    final uri = Uri.https(_baseUrl, '$_defaultUrl/api/location/$locationId');
    final response = await _httpClient.get(uri);
    if (response.statusCode != 200) {
      throw Exception('getWeather failed!');
    }
    logger.d('[${uri.toString()}] => ${response.body}');
    return weatherFromJson(response.body);
  }
}
