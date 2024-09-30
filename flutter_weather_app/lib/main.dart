import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WeatherHome(), // Đặt WeatherHome là màn hình chính
    );
  }
}
