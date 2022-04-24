import 'package:flutter/material.dart';
import 'package:my_weather/weather.dart';
import 'package:my_weather/weather_screen_manager.dart';

class WeatherSceen extends StatefulWidget {
  const WeatherSceen({Key? key}) : super(key: key);

  @override
  State<WeatherSceen> createState() => _WeatherSceenState();
}

class _WeatherSceenState extends State<WeatherSceen> {
  final manager = WeatherScreenManager();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blue[300],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Icon(
                  Icons.wb_sunny_outlined,
                  size: 100,
                  color: Colors.yellow,
                ),
                SizedBox(height: 20),
                ValueListenableBuilder<Weather>(
                    valueListenable: manager.weatherNotifier,
                    builder: (context, value, child) {
                      switch (value) {
                        case Weather.sunny:
                          return Icon(Icons.wb_sunny_outlined);
                        case Weather.cloudy:
                          return Icon(Icons.wb_cloudy_outlined);
                        case Weather.rainy:
                          return Icon(Icons.wb_cloudy_rounded);
                        default:
                          return Icon(Icons.wb_sunny_outlined);
                      }
                      Text(
                        'jjz',
                        style: TextStyle(color: Colors.red, fontSize: 40),
                      );
                    }),
                const Text(
                  'Ulaanbaatar',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                SizedBox(height: 10),
                Spacer(),
                ElevatedButton(
                  child: Text('Update'),
                  onPressed: () {
                    manager.updateWeather();
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}
