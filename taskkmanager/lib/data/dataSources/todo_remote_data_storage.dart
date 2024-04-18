import 'package:taskkmanager/data/models/todoModel.dart';

abstract class TodoRemoteStorage {
  Future<TodoModel> viewAllUsers();
  Future<TodoModel> ViewAUser({id});
}
