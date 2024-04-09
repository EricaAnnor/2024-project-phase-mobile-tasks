import 'package:flutter/material.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({super.key});

  @override
  Widget build(context) {
    return Column(
      children: [
        Container(
            // alignment: Alignment.center,
            child: Image.asset(
          'assets/shopping.png',
          width: 220,
        )),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Title", style: TextStyle(fontSize: 24)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Card(
                color: Color.fromRGBO(241, 238, 238, 1),
                child: SizedBox(
                    width: 440,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text("UI/UX App Design",
                          style: TextStyle(fontSize: 18)),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Description", style: TextStyle(fontSize: 20)),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  color: Color.fromRGBO(241, 238, 238, 1),
                  child: SizedBox(
                      width: 440,
                      height: 90,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'First I have to animate the logo and prototyping my design. It’svery important.',
                            style: TextStyle(fontSize: 18)),
                      )),
                )),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Deadline", style: TextStyle(fontSize: 22)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Card(
                  color: Color.fromRGBO(241, 238, 238, 1),
                  child: SizedBox(
                      width: 440,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text('April 29,2023',
                            style: TextStyle(fontSize: 16)),
                      ))),
            )
          ]),
        )
      ],
    );
  }
}
