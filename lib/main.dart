import 'package:flutter/material.dart';
import 'package:my_weather/home_screen.dart';
import 'package:my_weather/home_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherSceen(),
    );
  }
}
