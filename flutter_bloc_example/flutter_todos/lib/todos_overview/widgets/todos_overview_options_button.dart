import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/l10n/l10n.dart';
import 'package:flutter_todos/todos_overview/bloc/todos_overview_bloc.dart';

@visibleForTesting
enum TodosOverviewOption { toggleAll, clearCompleted }

class TodosOverviewOptionsButton extends StatelessWidget {
  const TodosOverviewOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final todos = context.select((TodosOverviewBloc bloc) => bloc.state.todos);
    final hasTodos = todos.isNotEmpty;
    final completedTodoAmount = todos.where((todo) => todo.isCompleted).length;
    return PopupMenuButton<TodosOverviewOption>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: TodosOverviewOption.toggleAll,
          enabled: hasTodos,
          child: Text(
            completedTodoAmount == todos.length
                ? l10n.todosOverviewOptionsMarkAllIncomplete
                : l10n.todosOverviewOptionsMarkAllComplete,
          ),
        ),
        PopupMenuItem(
          value: TodosOverviewOption.clearCompleted,
          enabled: hasTodos && completedTodoAmount > 0,
          child: Text(l10n.todosOverviewOptionsClearCompleted),
        )
      ],
      icon: const Icon(Icons.more_vert_rounded),
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      tooltip: l10n.todosOverviewOptionsTooltip,
      onSelected: (value) {
        switch (value) {
          case TodosOverviewOption.toggleAll:
            context
                .read<TodosOverviewBloc>()
                .add(const TodosOverviewToggleAllRequested());
            break;

          case TodosOverviewOption.clearCompleted:
            context
                .read<TodosOverviewBloc>()
                .add(const TodosOverviewClearCompletedRequested());
            break;
        }
      },
    );
  }
}
