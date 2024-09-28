import 'package:flutter/material.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/pages/header.dart';
import 'package:weather/pages/searchbar.dart';
import 'package:weather/pages/weather_panel.dart';
import '../services/WeatherServices.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({super.key});
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String? city;
  Weather? weather;
  List<Weatherforecast>? foreCast;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    WeatherService weatherService = WeatherService();
    String fetchedCity = await weatherService.getCity();
    List<Object> wList = await weatherService.getWeather(fetchedCity);

    setState(() {
      city = fetchedCity;
      weather = wList[0] as Weather;
      foreCast = wList[1] as List<Weatherforecast>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff0C0B30),
                Color(0xff0C0B50),
                Color(0xff0C0B32),
              ]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Header(),
                SizedBox(height: 10),
                SearchPannel(),
                SizedBox(height: 10),
                weather != null
                    ? WeatherPanel(weather: weather!)
                    : CircularProgressIndicator(),
                SizedBox(height: 20),
                weather == null
                    ? Container()
                    : Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: foreCast?.length,
                          itemBuilder: (BuiltContext, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(20)),
                                child: ListTile(
                                  leading: Text(
                                      foreCast![index].date.substring(8, 11),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300)),
                                  title: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/images/' +
                                              foreCast![index].icon +
                                              '.png',
                                          scale: 30,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                            foreCast![index].main.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: 1,
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                      )
                                    ],
                                  ),
                                  trailing: Text(
                                    foreCast![index]
                                            .temp
                                            .toString()
                                            .substring(0, 2) +
                                        '°C',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
