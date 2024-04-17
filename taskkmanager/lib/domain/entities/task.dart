import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Task {
  String id;
  String title;
  String description;
  DateTime deadline;
  // Color? color;

  Task(this.title, this.deadline, this.description)
      : id = const Uuid().v4();
}
