import 'dart:math';

import "package:flutter/material.dart";
import 'package:taskkmanager/body.dart';
import 'package:taskkmanager/new_task.dart';
import 'package:taskkmanager/task_detail.dart';

class Todobody extends StatefulWidget {
  const Todobody({super.key});

  @override
  State<Todobody> createState() => _TodobodyState();
}

class _TodobodyState extends State<Todobody> {
  List<Body> tasks = [];

  @override
  Widget build(context) {
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        key: const Key('todoColumn'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.center,
              child: Image.asset('assets/stickman.png')),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Tasks List",
                key: (Key('tasklists')),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: 330,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...tasks.map((task) => Card(
                      key: Key(task.name),
                      color: Colors.white,
                      child: _tile(
                          (task.name.isNotEmpty) ? task.name[0] : 'U',
                          task.name,
                          task.description,
                          task.date,
                          getRandomColor())))
                  // Card(
                  //     color: Colors.white,
                  //     child: _tile(
                  //         'U', "UI/UX App", "Design", "April 5,2023", Colors.red)),
                  // Card(
                  //     color: Colors.white,
                  //     child: _tile('U', "UI/UX App", "Design", "April 5,2023",
                  //         Colors.green)),
                  // Card(
                  //     color: Colors.white,
                  //     child: _tile('V', "View Candidates", " ", "April 5,2023",
                  //         Colors.yellow)),
                  // Card(
                  //     color: Colors.white,
                  //     child: _tile('F', "Football Cu", "Dribbling", "April 5,2023",
                  //         Colors.pink)),
                ],
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: ElevatedButton(
                key: const Key('_todo'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(238, 111, 87, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 78, vertical: 14),
                    shape: const RoundedRectangleBorder()),
                child: const Text("Create Task",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () async {
                  Body? object = await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => AddTask()));
                  // await Navigator.of(context).pushNamed('/addTask');
                  if (object != null) {
                    setState(() {
                      tasks.add(object);
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getRandomColor() {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];

    Random random = Random();
    int index = random.nextInt(colors.length);
    return colors[index];
  }

  ListTile _tile(String lead, String tit, String sub, String trail, Color col) {
    Body nBody = Body(tit, sub, trail);
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TaskDetail(bod: nBody),
          ),
        );
      },
      leading: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Text(
          lead,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.normal),
        ),
      ),
      title: Text(
        tit,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        sub,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                trail,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
          Container(
            color: col,
            height: 46,
            width: 4,
          ),
        ],
      ),
    );
  }

  Route _todoButton() {
    return PageRouteBuilder(
        pageBuilder: ((context, animation, secondaryAnimation) => AddTask()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 0.1);
          const end = Offset(0.0, 0.0);
          const curve = Curves.ease;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
              position: animation.drive(tween), child: child);
        });
  }
}
