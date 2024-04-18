import 'package:flutter_test/flutter_test.dart';
import 'package:taskkmanager/domain/entities/task.dart';
import 'package:taskkmanager/data/models/todoModel.dart';

void main() {
  group('TodoModel', () {
    final todoModel = TodoModel(
      "Task Title",
      DateTime(2022, 04, 20, 15, 30),
      "Task Description",
    );

    test('should return a valid model from JSON', () {
      // Given
      final Map<String, dynamic> jsonMap = {
        'title': 'Task Title',
        'description': 'Task Description',
        'deadline': '2022-04-20T15:30:00',
      };

      // When
      final result = TodoModel.fromJson(jsonMap);

      // Then
      expect(result, isA<TodoModel>());
      expect(result.title, 'Task Title');
      expect(result.description, 'Task Description');
      expect(result.deadline, DateTime(2022, 04, 20, 15, 30));
    });

    test('should return a JSON map containing proper data', () {
      // When
      final result = todoModel.toJson();

      // Then
      final expectedMap = {
        'title': 'Task Title',
        'description': 'Task Description',
        'deadline': DateTime(2022, 04, 20, 15, 30).toIso8601String(),
      };

      expect(result, expectedMap);
    });
  });
}
