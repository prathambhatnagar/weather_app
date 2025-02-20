import 'package:flutter/material.dart';
import 'package:weather/pages/searchbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchedCity = '';

  void handleSearch(String city) {
    setState(() {
      searchedCity = city;
    });
    print("Searching for city: $city");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchPannel(onSearch: handleSearch),
          SizedBox(height: 20),
          Text(
            searchedCity.isEmpty ? "Enter a city name" : "City: $searchedCity",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
