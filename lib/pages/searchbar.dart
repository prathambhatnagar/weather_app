import 'package:flutter/material.dart';

class SearchPannel extends StatefulWidget {
  SearchPannel({super.key});
  @override
  State<SearchPannel> createState() => _SearchPannelState();
}

class _SearchPannelState extends State<SearchPannel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0x1AFFFFFF), width: 2),
        borderRadius: BorderRadius.circular(50),
        color: Color(0xff0C0B3f),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TextFormField(
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1),
              border: InputBorder.none,
              hintText: "Search for a City",
              prefixIcon: Icon(Icons.pin_drop, size: 25, color: Colors.white70),
              suffixIcon: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Icon(Icons.search, size: 25, color: Colors.white70),
                ),
              )),
          style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
              fontWeight: FontWeight.w300,
              letterSpacing: 1),
        ),
      ),
    );
  }
}
