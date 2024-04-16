import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  final int initialValue; // Define a parameter for initial value

  Count(this.initialValue);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  late int count; // Use late initialization for count

  @override
  void initState() {
    super.initState();
    count = widget.initialValue; // Initialize count with initialValue from widget
  }

  int increment(count){
    return (count + 1) % 11;

  }

  int decrement(count){
    return (count - 1) % 11;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            '$count',
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
              onPressed:(){
                setState(() {
                  count = increment(count);
                });
              
              },
              child: Text(
                'Increment',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(55, 46, 29, 1),
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count = decrement(count);
                });
              },
              child: const Text(
                'Decrement',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(55, 46, 29, 1),
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
           
          ],
        ),
      ],
    );
  }
}
