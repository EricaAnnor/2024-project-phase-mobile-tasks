import 'package:flutter/material.dart';
import 'package:taskkmanager/body.dart';

class TaskDetail extends StatelessWidget {
  final Body bod;
  const TaskDetail({super.key, required this.bod});

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                color: Color.fromRGBO(238, 111, 87, 1)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Task Detail"),
          centerTitle: true,
          actions: [
            IconButton(
                icon:
                    const Icon(Icons.more_vert, size: 30, color: Colors.black),
                onPressed: () {}),
          ],
        ),
        body: Column(
          children: [
            Container(
                // alignment: Alignment.center,
                child: Image.asset(
              'assets/shopping.png',
              width: 220,
            )),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Title", style: TextStyle(fontSize: 24)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        color: const Color.fromRGBO(241, 238, 238, 1),
                        child: SizedBox(
                            width: 440,
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(bod.name,
                                  style: const TextStyle(fontSize: 18)),
                            )),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child:
                          Text("Description", style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          color: const Color.fromRGBO(241, 238, 238, 1),
                          child: SizedBox(
                              width: 440,
                              height: 90,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(bod.description,
                                    style: const TextStyle(fontSize: 18)),
                              )),
                        )),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Deadline", style: TextStyle(fontSize: 22)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                          color: const Color.fromRGBO(241, 238, 238, 1),
                          child: SizedBox(
                              width: 440,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Text(bod.date,
                                    style: const TextStyle(fontSize: 16)),
                              ))),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
