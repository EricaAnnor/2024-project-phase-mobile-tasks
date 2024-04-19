import 'package:taskkmanager/data/models/todoModel.dart';

abstract class TodoLocalStorage {
  
  Future<List<TodoModel>> viewAllTasks();
  
  Future<TodoModel> viewATask({int id});
}
