import 'package:dartz/dartz.dart' hide Task;
import 'package:taskkmanager/core/error/failure.dart';
import 'package:taskkmanager/core/usescase.dart';
import 'package:taskkmanager/domain/entities/task.dart';
import 'package:taskkmanager/domain/repositories/repository.dart';

class ViewTask implements Usecase<List<Task>, String> {
  final TodoRepo repo;

  ViewTask(this.repo);

  @override
  Future<Either<Failure, List<Task>>> call(params) async {
    return await repo.viewTodos();
  }
}
