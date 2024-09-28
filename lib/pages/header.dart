import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Material(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xff171A5C),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white70,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.white70,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Today",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert, color: Colors.white60)
            ],
          ),
        ],
      ),
    );
  }
}
