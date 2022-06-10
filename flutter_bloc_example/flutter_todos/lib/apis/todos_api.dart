
import 'package:flutter_todos/apis/models/todo.dart';

abstract class TodoApi {
  const TodoApi();

  Stream<List<Todo>> getTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String id);

  Future<int> clearCompleted();

  Future<int> completeAll({required bool isCompleted});
}

class TodoNotFoundException implements Exception {}
