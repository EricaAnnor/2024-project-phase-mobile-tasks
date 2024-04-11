import 'package:flutter/material.dart';
import 'package:taskkmanager/new_task.dart';
// import 'package:taskkmanager/todo.dart';
import 'package:taskkmanager/splash.dart';
import 'package:taskkmanager/todo.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => const Splash(),
    '/addtask': (context) => AddTask(),
    // '/details':(context) => TaskDetail(bod: bod),
    '/todolist': (context) => const Todo(),
  }));
}
