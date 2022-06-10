import 'package:flutter_todos/apis/models/todo.dart';
import 'package:flutter_todos/apis/todos_api.dart';

class TodosRepository {
  const TodosRepository({
    required TodoApi todoApi,
  }) : _todoApi = todoApi;

  final TodoApi _todoApi;

  Stream<List<Todo>> getTodos() => _todoApi.getTodos();

  Future<void> saveTodo(Todo todo) => _todoApi.saveTodo(todo);

  Future<void> deleteTodo(String id) => _todoApi.deleteTodo(id);

  Future<int> completedAll({required bool isCompleted}) =>
      _todoApi.completeAll(isCompleted: isCompleted);

  Future<int> clearCompleted() => _todoApi.clearCompleted();
}
