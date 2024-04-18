import 'package:taskkmanager/domain/entities/task.dart';

class TodoModel extends Task {
  TodoModel(
    String title,
    DateTime deadline,
    String description,
  ) : super(
          title,
          deadline,
          description,
        );



  // Factory method to create a TodoModel instance from JSON map
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      json['title'] as String,
      DateTime.parse(json['deadline'] as String),
      json['description'] as String,
    );
  }

  
  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'deadline': deadline,
        
      };

}
