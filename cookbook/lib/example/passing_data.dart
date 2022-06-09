import 'package:cookbook/example/base_widget.dart';
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

final todos = List.generate(
  200,
  (index) => Todo(
    'TODO#$index',
    'description#$index',
  ),
);

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildTodoListView(),
    );
  }

  Widget _buildTodoListView() => ListView.separated(
        itemCount: todos.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (BuildContext context, int index) {
          var todo = todos[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 2.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: index.isEven ? Colors.grey : Colors.indigoAccent,
              ),
              child: ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                onTap: () {
                  if (index.isEven) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(todo: todo),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DetailScreen2(),
                        settings: RouteSettings(arguments: todo),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      );

  AppBar _buildAppBar() => AppBar();
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: Text(todo.title),
      );

  Widget _buildContent() => Center(
        child: Text(todo.description),
      );
}

class DetailScreen2 extends BaseStatelessWidget {
  const DetailScreen2({
    Key? key,
  }) : super(key: key);

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) => AppBar();

  @override
  Widget buildContent(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;
    return Center(
      child: Text(todo.description),
    );
  }
}
