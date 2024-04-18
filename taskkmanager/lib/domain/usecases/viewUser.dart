import 'package:dartz/dartz.dart' hide Task;
import 'package:taskkmanager/core/error/failure.dart';
import 'package:taskkmanager/core/usescase.dart';
import 'package:taskkmanager/domain/entities/task.dart';
import 'package:taskkmanager/domain/repositories/repository.dart';




class ViewTask implements Usecase<Task,String>{
  final TodoRepo repository;
  ViewTask(this.repository);

  @override
  Future<Either<Failure, Task>> call(String id) async {
    return await repository.viewATodo(id);
  }
}
