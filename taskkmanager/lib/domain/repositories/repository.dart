import 'package:dartz/dartz.dart' hide Task;
import 'package:taskkmanager/core/error/failure.dart';
import 'package:taskkmanager/domain/entities/task.dart';
// import 'package:taskkmanager/network/networkInfo.dart';

abstract class TodoRepo {
  Future<Either<Failure, String>> createTodo(
      String? title, String? description, DateTime? date);

  Future<Either<Failure, List<Task>>> viewTodos();

  Future<Either<Failure, Task>> viewATodo(String id);
}
