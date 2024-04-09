import 'package:flutter/material.dart';
import 'package:taskkmanager/new_task_body.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                    color: const Color.fromRGBO(238, 111, 87, 1)),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                    color: Colors.black,
                    iconSize: 30,
                  )
                ]),
            body: NewBody('22-09-2023')));
  }
}
