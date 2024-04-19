import 'dart:convert';

import 'package:taskkmanager/data/dataSources/todo_local_storage.dart';
import 'package:taskkmanager/data/models/todoModel.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:taskkmanager/core/error/exceptions.dart';
import 'package:taskkmanager/core/error/failure.dart';

class TodoLocalImpl implements TodoLocalStorage {
  final SharedPreferences sharedPreferences;

  TodoLocalImpl(this.sharedPreferences);

  @override
  Future<List<TodoModel>> viewAllTasks() {
    const String cachekey = 'cachekey';

    final jsonString = sharedPreferences.getString(cachekey);

    if (jsonString != null) {
      final mapp = json.decode(jsonString) as Map<String, dynamic>;
      List<TodoModel> task =
          mapp.values.map((_task) => TodoModel.fromJson(_task)).toList();
      return Future.value(task);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<TodoModel> viewATask({int? id}) {
    const String cacheKey = 'cacheKey';

    final jsonString = sharedPreferences.getString(cacheKey);

    if (jsonString != null) {
      final mapp = json.decode(jsonString) as Map<String, dynamic>;

      for (var taskkey in mapp.keys) {
        final taskjson = mapp[taskkey];

        if (taskjson['id'] == id) {
          return Future.value(TodoModel.fromJson(taskjson));
        }
      }
      
      throw CacheException();
      
    } else {
      throw CacheException();
    }
  }
}
