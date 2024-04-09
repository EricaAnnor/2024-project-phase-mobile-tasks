import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: Center(
                child: Image.asset('assets/painting.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(12, 140, 233, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 78, vertical: 14),
                    shape: const RoundedRectangleBorder()),
                child: const Text("Get Started",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () {},
              ),
            ),
          ])),
    );
  }
}
