import 'package:dartz/dartz.dart' hide Task;
import 'package:taskkmanager/core/error/failure.dart';
import 'package:taskkmanager/core/usescase.dart';
import 'package:taskkmanager/domain/repositories/repository.dart';
import 'package:taskkmanager/domain/entities/task.dart';

class CreateUser implements Usecase<String, Task> {
  final TodoRepo repo;

  CreateUser(this.repo);

  @override
  Future<Either<Failure, String>> call(Task params) async {
    return await repo.createTodo(params.title, params.description, params.deadline);
  }
}


