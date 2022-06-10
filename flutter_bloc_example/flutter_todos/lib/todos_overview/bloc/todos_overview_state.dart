part of 'todos_overview_bloc.dart';

enum TodosOverviewStatus { initial, loading, success, failure }

class TodosOverviewState extends Equatable {
  const TodosOverviewState({
    this.status = TodosOverviewStatus.initial,
    this.todos = const [],
    this.filter = TodosViewFilter.all,
    this.lastDeletedTodo,
  });

  final TodosOverviewStatus status;
  final List<Todo> todos;
  final TodosViewFilter filter;
  final Todo? lastDeletedTodo;

  Iterable<Todo> get filterTodos => filter.applyAll(todos);

  TodosOverviewState copyWith({
    TodosOverviewStatus? status,
    List<Todo>? todos,
    TodosViewFilter? filter,
    Todo? Function()? lastDeletedTodo,
  }) =>
      TodosOverviewState(
        status: status ?? this.status,
        todos: todos ?? this.todos,
        filter: filter ?? this.filter,
        lastDeletedTodo:
            lastDeletedTodo != null ? lastDeletedTodo() : this.lastDeletedTodo,
      );

  @override
  List<Object?> get props => [status, todos, filter, lastDeletedTodo];
}
