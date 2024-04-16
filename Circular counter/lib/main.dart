import 'package:flutter/material.dart';
import 'package:task_three/counter.dart';

void main() {
  runApp(
    MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:Center(child: Text('Counter App',style: TextStyle(fontSize: 30,color: Colors.white),)),
          backgroundColor:const Color.fromRGBO(55, 46, 29, 1)
        ),
        body:Counter()
      )
    )
  );
}