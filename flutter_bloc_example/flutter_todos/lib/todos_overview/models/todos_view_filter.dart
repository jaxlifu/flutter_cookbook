import 'package:flutter_todos/apis/models/todo.dart';

enum TodosViewFilter {
  all,
  activeOnly,
  completedOnly;

  bool apply(Todo todo) {
    switch (this) {
      case TodosViewFilter.activeOnly:
        return !todo.isCompleted;
      case TodosViewFilter.completedOnly:
        return todo.isCompleted;
      case TodosViewFilter.all:
        return true;
    }
  }

  Iterable<Todo> applyAll(Iterable<Todo> todos) {
    return todos.where(apply);
  }
}
