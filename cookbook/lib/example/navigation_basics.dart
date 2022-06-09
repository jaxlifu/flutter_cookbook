import 'package:flutter/material.dart';

class ExampleNavigationBasics extends StatefulWidget {
  const ExampleNavigationBasics({Key? key}) : super(key: key);

  @override
  State<ExampleNavigationBasics> createState() =>
      _ExampleNavigationBasicsState();
}

class _ExampleNavigationBasicsState extends State<ExampleNavigationBasics> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirstRoute.routeName,
      routes: {
        FirstRoute.routeName: (_) => const FirstRoute(),
        SecondRoute.routeName: (_) => const SecondRoute(),
        ExtractArgumentsScreen.routeName: (_) => const ExtractArgumentsScreen(),
        SelectionScreen.routeName: (_) => const SelectionScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case PassArgumentsScreen.routeName:
            final args = settings.arguments as ScreenArguments;
            return MaterialPageRoute(
              builder: (_) => PassArgumentsScreen(
                title: args.title,
                message: args.message,
              ),
            );
        }
        return null;
      },
    );
  }
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  void _navigateAndDisplaySelection(BuildContext context) async {
    debugPrint('navigator to SelectionScreen');
    final result =
        await Navigator.pushNamed(context, SelectionScreen.routeName);
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(result.toString())),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstRoute'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondRoute(),
                    ),
                  );
                },
                child: const Text('Open route push'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SecondRoute.routeName);
                },
                child: const Text('Open route pushNamed'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ExtractArgumentsScreen.routeName,
                    arguments: ScreenArguments(
                      'ExtractArgumentsScreen',
                      'ExtractArgumentsScreen message',
                    ),
                  );
                },
                child: const Text('Open ExtractArgumentsScreen'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PassArgumentsScreen.routeName,
                    arguments: ScreenArguments(
                      'PassArgumentsScreen',
                      'PassArgumentsScreen message',
                    ),
                  );
                },
                child: const Text('Open PassArgumentsScreen'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () {
                  _navigateAndDisplaySelection(context);
                },
                child: const Text('Open SelectionScreen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);
  static const routeName = '/second';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondRoute'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back'),
        ),
      ),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({Key? key}) : super(key: key);

  static const routeName = '/extract_arguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(child: Text(args.message)),
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {
  const PassArgumentsScreen({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  static const routeName = '/pass_arguments';

  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text(message)),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "yes");
                },
                child: const Text('yes'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "no");
                },
                child: const Text('no'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
