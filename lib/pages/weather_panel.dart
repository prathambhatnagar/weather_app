import 'package:flutter/material.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/services/WeatherServices.dart';

class WeatherPanel extends StatefulWidget {
  final Weather weather;
  WeatherPanel({super.key, required this.weather});

  @override
  State<WeatherPanel> createState() => _WeatherPanelState();
}

class _WeatherPanelState extends State<WeatherPanel> {
  bool unitflag = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.1,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0x1AFFFFFF), width: 2),
          borderRadius: BorderRadius.circular(35),
          color: Color(0x0fFFFFFF)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/09d.png', scale: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                          unitflag
                              ? widget.weather.temp.toString().substring(0, 2)
                              : widget.weather.tempf.toString().substring(0, 2),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.bold)),
                      Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unitflag = true;
                                  });
                                },
                                child: Text('°C',
                                    style: TextStyle(
                                        color: unitflag
                                            ? Colors.white
                                            : Colors.white24,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w300)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('|',
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w200)),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unitflag = false;
                                  });
                                },
                                child: Text('°F',
                                    style: TextStyle(
                                        color: unitflag
                                            ? Colors.white24
                                            : Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w300)),
                              ),
                            ],
                          ),
                          SizedBox(height: 20)
                        ],
                      ),
                    ],
                  ),
                  Text(
                      widget.weather.description[0].toUpperCase() +
                          widget.weather.description.substring(1).toLowerCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1)),
                  Text(widget.weather.city + ", " + widget.weather.country,
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1))
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/wind.png',
                      scale: 22,
                    ),
                    SizedBox(height: 5),
                    Text(widget.weather.wind.toString() + ' m/s',
                        style: TextStyle(color: Colors.white)),
                    Text('Wind',
                        style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1)),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/drop.png',
                      scale: 38,
                    ),
                    SizedBox(height: 6),
                    Text(widget.weather.humidity.toString() + "%",
                        style: TextStyle(color: Colors.white)),
                    Text(
                      'Humidity',
                      style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/whiterain.png',
                      scale: 35,
                    ),
                    SizedBox(height: 5),
                    Text('90%', style: TextStyle(color: Colors.white)),
                    Text('Rain',
                        style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
