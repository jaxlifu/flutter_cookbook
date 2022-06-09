import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc_example/theme/bloc/theme_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Text('$state');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'CounterIncremented',
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncremented());
              context.read<ThemeBloc>().add(ThemeLighted());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'CounterDecremented',
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecremented());
              context.read<ThemeBloc>().add(ThemeDarked());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
