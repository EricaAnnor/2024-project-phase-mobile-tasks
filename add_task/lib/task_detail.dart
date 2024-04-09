import 'package:flutter/material.dart';
import "package:taskkmanager/task_detail_body.dart";

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: Color.fromRGBO(238, 111, 87, 1)),
                onPressed: () {},
              ),
              title: const Text("Task Detail"),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: const Icon(Icons.more_vert,
                        size: 30, color: Colors.black),
                    onPressed: () {}),
              ],
            ),
            body: const TaskBody()));
  }
}
