import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_todos/apis/models/todo.dart';
import 'package:flutter_todos/apis/todos_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageTodosApi extends TodoApi {
  LocalStorageTodosApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }
  @visibleForTesting
  static const kTodosCollectionKey = '__todos_collection_key__';

  final SharedPreferences _plugin;

  final _todoStreamController = BehaviorSubject<List<Todo>>.seeded(const []);

  String? _getValue(String key) => _plugin.getString(key);

  Future<void> _setValue({
    String key = kTodosCollectionKey,
    required String value,
  }) =>
      _plugin.setString(key, value);

  void _init() {
    final todosJson = _getValue(kTodosCollectionKey);
    if (todosJson != null) {
      final todos = List<Map>.from(jsonDecode(todosJson) as List)
          .map((jsonMap) => Todo.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _todoStreamController.add(todos);
    } else {
      _todoStreamController.add(const []);
    }
  }

  List<Todo> get todos => [..._todoStreamController.value];

  @override
  Future<int> clearCompleted() async {
    final todos = this.todos;
    final completedTodosAmount = todos.where((todo) => todo.isCompleted).length;
    todos.removeWhere((todo) => todo.isCompleted);
    _todoStreamController.add(todos);
    await _setValue(value: jsonEncode(todos));
    return completedTodosAmount;
  }

  @override
  Future<int> completeAll({required bool isCompleted}) async {
    final todos = this.todos;
    final changedTodosAmount =
        todos.where((todo) => todo.isCompleted != isCompleted).length;
    final newTodos =
        todos.map((todo) => todo.copyWith(isCompleted: isCompleted)).toList();
    _todoStreamController.add(newTodos);
    await _setValue(value: jsonEncode(newTodos));
    return changedTodosAmount;
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todos = this.todos;
    final todoIndex = todos.indexWhere((todo) => todo.id == id);
    if (todoIndex == -1) {
      throw TodoNotFoundException();
    }

    todos.removeAt(todoIndex);
    _todoStreamController.add(todos);
    return _setValue(value: jsonEncode(todos));
  }

  @override
  Stream<List<Todo>> getTodos() => _todoStreamController.asBroadcastStream();

  @override
  Future<void> saveTodo(Todo todo) {
    final todos = this.todos;
    final todoIndex = todos.indexWhere((todo) => todo.id == todo.id);
    if (todoIndex >= 0) {
      todos[todoIndex] = todo;
    } else {
      todos.add(todo);
    }
    _todoStreamController.add(todos);
    return _setValue(value: jsonEncode(todos));
  }
}
