import 'package:taskkmanager/domain/entities/task.dart';

class TodoModel extends Task {
  TodoModel({
    required super.id,
    required super.title,
    required super.description,
    required super.deadline,
  });

  Map<String, dynamic> toJson() => {
        'id':id,
        'title': title,
        'description': description,
        'deadline': deadline,
      };

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      deadline: json['deadLine'] as DateTime,
    );
  }
}