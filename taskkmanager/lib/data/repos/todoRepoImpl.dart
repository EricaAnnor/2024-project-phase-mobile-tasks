import 'package:dartz/dartz.dart' hide Task;
import 'package:taskkmanager/core/error/exceptions.dart';
import 'package:taskkmanager/core/error/failure.dart';
import 'package:taskkmanager/core/network/networkInfo.dart';
import 'package:taskkmanager/domain/entities/task.dart';
import 'package:taskkmanager/domain/repositories/repository.dart';

class TodoRepoImp implements TodoRepo {
  NetworkInfo networkInfo;
  List<Task> taskList = [];

  int count = 0;

  TodoRepoImp(this.networkInfo);

  @override
  Future<Either<Failure, String>> createTodo(
      String? title, String? description, DateTime? date) async {
    if (await networkInfo.isConnected) {
      try {
        if (title == null || description == null || date == null) {
          return Left(Failure('Task creation was not successful'));
        }

        Task newTask = Task(
            id: count++,
            title: title,
            deadline: date,
            description: description);
        taskList.add(newTask);

        return const Right('Task created successfully');
      } on ServerException {
        return Left(Failure('Task creation was not succesful'));
      }
    } else {
      return Left(ServerFailure('Server is Offline'));
    }
  }

  @override
  Future<Either<Failure, Task>> viewATodo(String id) async {
    if (await networkInfo.isConnected) {
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
    } else {
      return Left(ServerFailure("Server has no internet connectivity"));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> viewTodos() async {
    if (await networkInfo.isConnected) {
      try {
        if (taskList.isEmpty) {
          return Future.value(Left(Failure('No tasks found')));
        }

        return Future.value(Right(taskList));
      } on ServerException {
        return Future.value(Left(Failure('An unexpected error occurred')));
      }
    } else {
      return Left(ServerFailure("Server has no internet connectivity"));
    }
  }
}
