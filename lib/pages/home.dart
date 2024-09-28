import 'package:flutter/material.dart';
import 'package:weather/pages/searchbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(child: SearchPannel()),
    );
  }
}
