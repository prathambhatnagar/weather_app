import 'dart:convert';
import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather/model/weather_model.dart';

class WeatherService {
  String apiKey = '79f81ac4c9d440c57189aaf857b56310';

  // Get City Method
  Future<String> getCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        throw "Location permission denied";
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String city = placeMarks[0].locality ?? "Unknown City";
    return city;
  }

  //   getWeather  Method
  Future<List<Object>> getWeather(String city) async {
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=79f81ac4c9d440c57189aaf857b56310'));
    dynamic dataforecast = jsonDecode(response.body);
    response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=79f81ac4c9d440c57189aaf857b56310'));
    dynamic dataWeather = jsonDecode(response.body);

    String locality = dataWeather['name'];
    String country = dataWeather['sys']['country'];
    int humidity = dataWeather['main']['humidity'];
    int pressure = dataWeather['main']['pressure'];
    double temp = dataWeather['main']['temp'];
    double tempMin = dataWeather['main']['temp_min'];
    double tempMax = dataWeather['main']['temp_max'];
    String main = dataWeather['weather'][0]["main"];
    String description = dataWeather['weather'][0]['description'];
    String icon = dataWeather['weather'][0]['icon'];
    double wind = dataWeather['wind']['speed'];
    temp = temp - 273.15;
    double tempf = temp * (9 / 5) + 32;

    int i = 0;
    int counter = 0;
    List<Weatherforecast> forecastList = [];
    String preDate = '';

    while (i < 7 && counter < dataforecast['list'].length) {
      // Ensure the counter is within bounds
      if (dataforecast['list'][counter]['dt_txt'].substring(8, 10) != preDate) {
        forecastList.add(Weatherforecast(
            temp: (dataforecast['list'][counter]['main']['temp'] - 273.15),
            icon: dataforecast['list'][counter]['weather'][0]['icon'],
            date: dataforecast['list'][counter]['dt_txt']
                .toString()
                .substring(0, 11),
            main: dataforecast['list'][counter]['weather'][0]['description']));
        i++;
      }
      preDate = dataforecast['list'][counter]['dt_txt'].substring(8, 10);
      counter++;
    }

    if (i < 7) {
      print("Warning: Couldn't retrieve 7 days of forecast data.");
    }

    print(forecastList.length);
    for (Weatherforecast w in forecastList) {
      print(w.date);
    }

    return [
      Weather(
          city: locality,
          humidity: humidity,
          temp: temp,
          main: main,
          tempMax: tempMax,
          tempMin: tempMin,
          description: description,
          icon: icon,
          pressure: pressure,
          wind: wind,
          country: country,
          tempf: tempf),
      forecastList
    ];
  }
}

class Weatherforecast {
  late String icon;
  late double temp;
  late String date;
  late String main;

  Weatherforecast(
      {required this.icon,
      required this.temp,
      required this.date,
      required this.main});
}

// String locality = data['name'];
// int humidity = data['main']['humidity'];
// int pressure = data['main']['pressure'];
// double temp = data['main']['temp'];
// double tempMin = data['main']['temp_min'];
// double tempMax = data['main']['temp_max'];
// String main = data['weather'][0]["main"];
// String description = data['weather'][0]['description'];
// String icon = data['weather'][0]['icon'];
// double wind = data['wind']['speed'];
// String country = data['sys']['country'];
