import 'dart:convert';
import 'package:http/http.dart';
import 'package:my_weather/weather.dart';

class WeatherData {
  Future<int> getDegree() async {
    final url = Uri.parse(
        'https://fcc-weather-api.glitch.me/api/current?lat=47&lon=106');
    final result = await get(url);
    final jsonString = result.body;
    final myMap = jsonDecode(jsonString);
    final degree = myMap['main']['temp'] as double;

    return degree.toInt();
  }

  Future<Weather> getWeather() async {
    final url = Uri.parse(
        'https://fcc-weather-api.glitch.me/api/current?lat=47&lon=106');
    final result = await get(url);
    final jsonString = result.body;
    final myMap = jsonDecode(jsonString);
    final weather = myMap['Weather'][0]['main'];
    print(weather);
    switch (weather) {
      case 'Cloudy':
        return Weather.cloudy;
      case 'Sunny':
        return Weather.sunny;
      default:
        return Weather.rainy;
    }
  }
}
