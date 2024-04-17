import 'package:dartz/dartz.dart' hide Task;
import 'package:taskkmanager/core/error/failure.dart';
import 'package:taskkmanager/domain/entities/task.dart';

abstract class TodoRepo {
  List<Task> taskList = [];

  Future<Either<Failure, String>> createTodo(
      String? title, String? description, DateTime? date) async {
    try {
      if (title == null || description == null || date == null) {
        return Left(Failure('Task creation was not successful'));
      }

      Task newTask = Task(title, date, description);
      taskList.add(newTask);

      return Right('Task created successfully');
    } catch (e) {
      return Left(Failure('Task creation was not succesful'));
    }
  }

  Future<Either<Failure, List<Task>>> viewTodos() {
    try {
      if (taskList.isEmpty) {
        return Future.value(Left(Failure('No tasks found')));
      }

      return Future.value(Right(taskList));
    } catch (e) {
      return Future.value(Left(Failure('An unexpected error occurred')));
    }
  }
  

  Future<Either<Failure, Task>> viewATodo(String id) {
    try {
      if (taskList.any((task) => task.id == id)) {
        Task taskWithId = taskList.firstWhere((task) => task.id == id);
        return Future.value(Right(taskWithId));
      } else {
        return Future.value(Left(Failure('Task not found')));
      }
    } catch (e) {
      return Future.value(Left(Failure('An unexpected error occurred')));
    }
  }

}
