import 'package:flutter/material.dart';

class SearchPannel extends StatefulWidget {
  final Function(String) onSearch;

  SearchPannel({super.key, required this.onSearch});

  @override
  State<SearchPannel> createState() => _SearchPannelState();
}

class _SearchPannelState extends State<SearchPannel> {
  final TextEditingController _controller = TextEditingController();

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
          controller: _controller,
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
                onTap: () {
                  if (_controller.text.isNotEmpty) {
                    widget.onSearch(_controller.text.trim());
                  }
                },
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
          onFieldSubmitted: (value) {
            if (value.isNotEmpty) {
              widget.onSearch(value.trim());
            }
          },
        ),
      ),
    );
  }
}
