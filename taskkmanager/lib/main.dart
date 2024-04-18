import 'package:flutter/material.dart';
// import 'package:taskkmanager/presentation/pages/task_detail.dart';
// import 'package:taskkmanager/todo.dart';
import 'package:taskkmanager/presentation/pages/new_task.dart';
import 'package:taskkmanager/presentation/pages/todo.dart';
import 'package:taskkmanager/presentation/pages/splash.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => const Splash(),
    '/addtask': (context) => const AddTask(),
    // '/details':(context) => TaskDetail(bod: bod),
    '/todolist': (context) => const Todo(),
  }));
}
