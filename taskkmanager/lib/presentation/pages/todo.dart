import 'package:flutter/material.dart';
import 'package:taskkmanager/presentation/widgets/todobody.dart';

class Todo extends StatelessWidget {
  const Todo({super.key});

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
          title: const Text("Todo List"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 36,
              ),
              onPressed: () {
                print("Menu button clicked");
              },
            )
          ],
        ),
        body: const Todobody(),
      ),
    );
  }

  
}
