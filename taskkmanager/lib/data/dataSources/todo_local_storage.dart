import 'package:taskkmanager/data/models/todoModel.dart';

abstract class TodoLocalStorage {
  Future<TodoModel> viewAllUsers();
  Future<TodoModel> ViewAUser({id});
}
