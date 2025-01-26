import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void timer() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  void initState() {
    // timer();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.indigo.shade900,
                Colors.indigo.shade900,
              ]),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              height: 300,
              // width: 100,
              child: Image.asset('assets/images/spash.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Daily",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Weather",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              child: Text(
                "Our Weather app will display accurate weather in real time."
                    .toLowerCase(),
                style: TextStyle(
                    color: Colors.white38,
                    fontSize: 15,
                    letterSpacing: 1,
                    height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 100),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 20, letterSpacing: 1, shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(.5),
                      blurRadius: .5,
                    )
                  ]),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue.shade500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                foregroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// gradient: LinearGradient(
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// colors: [
// Colors.deepPurple.shade900,
// Colors.deepPurple.shade800,
// Colors.deepPurple.shade800,
// Colors.deepPurple.shade900,
// ]),
// child: Image.asset('assets/images/spash.png'),
