class Weather {
  late double temp;
  late int humidity;
  late double tempMin;
  late double tempMax;
  late String city;
  late String main;
  late String description;
  late String icon;
  late int pressure;
  late double wind;
  late String country;
  late double tempf;

  Weather(
      {required this.temp,
      required this.humidity,
      required this.tempMin,
      required this.tempMax,
      required this.city,
      required this.main,
      required this.description,
      required this.icon,
      required this.pressure,
      required this.wind,
      required this.country,
      required this.tempf});

  @override
  String toString() {
    return 'Weather in $city: \n'
        'Temperature: $temp°C\n'
        'Humidity: $humidity%\n'
        'Min Temperature: $tempMin°C\n'
        'Max Temperature: $tempMax°C\n'
        'Condition: $main\n'
        'Description: $description\n'
        'Icon: $icon\n'
        'Pressure: $pressure hPa';
  }
}
