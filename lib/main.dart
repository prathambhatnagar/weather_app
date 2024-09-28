import 'package:flutter/material.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/pages/home.dart';
import 'package:weather/pages/searchbar.dart';
import 'package:weather/pages/weather_page.dart';
import 'package:weather/services/WeatherServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WeatherService weatherService = WeatherService();
  // String city = await weatherService.getCity();
  // weatherService.getWeather(city);
  // Weather weather = await weatherService.getWeather(city);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}
