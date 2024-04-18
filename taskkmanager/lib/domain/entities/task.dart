import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Task {
  int id;
  String title;
  String description;
  DateTime deadline;
  // Color? color;

  Task({required this.id,required this.title, required this.deadline,required this.description});
}
