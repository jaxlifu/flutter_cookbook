import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/counter/view/counter_bloc_page.dart';
import 'package:flutter_bloc_example/counter/view/counter_cubit_page.dart';
import 'package:flutter_bloc_example/theme/bloc/theme_bloc.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.themeData,
          title: "BlocApp",
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _items = <Widget>[
    const CounterCubitPage(),
    const CounterBlocPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(
                  state is ThemeLight ? Icons.dark_mode : Icons.light_mode),
              onPressed: () => context
                  .read<ThemeBloc>()
                  .add(state is ThemeLight ? ThemeDarked() : ThemeLighted()),
            );
          },
        )
      ],
    );
  }

  Widget _buildContent() => ListView.separated(
        itemCount: _items.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (BuildContext context, int index) {
          final item = _items[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => item));
            },
            leading: const Icon(Icons.abc),
            title: Text(item.toStringShort()),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      );
}
