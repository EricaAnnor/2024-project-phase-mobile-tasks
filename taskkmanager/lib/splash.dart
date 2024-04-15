import 'package:flutter/material.dart';
import 'package:taskkmanager/todo.dart';

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
                key: const Key('painter'),
                child: Image.asset('assets/painting.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ElevatedButton(
                key: const Key('splashBtn'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(12, 140, 233, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 78, vertical: 14),
                    shape: const RoundedRectangleBorder()),
                child: const Text("Get Started",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).push(_nextRoute());
                },
              ),
            ),
          ])),
    );
  }

  Route _nextRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Todo(),
        transitionsBuilder: (context, animation, secondary, child) {
          const begin = Offset(1.0, 0.0); // Start at left (off-screen)
          const end = Offset(0.0, 0.0);
          const curve = Curves.ease;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
              position: animation.drive(tween), child: child);
        });
  }
}
