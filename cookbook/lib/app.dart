import 'package:cookbook/items.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
    this.home,
  }) : super(key: key);

  final Widget? home;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late bool _isDark;
  @override
  void initState() {
    _isDark = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'cookbook examples',
      theme: _isDark ? ThemeData.dark() : ThemeData.light(),
      home: widget.home ?? _buildHomePage(context),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Cookbook'),
        actions: [
          IconButton(
            onPressed: _onThemeChanged,
            icon: Icon(_isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: _itemBuilder,
        itemCount: items.length,
      ),
    );
  }

  void _onThemeChanged() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final item = items[index];
    final IconData icon;
    switch (item.recommendation) {
      case Recommendation.yes:
        icon = const IconData(0x2705);
        break;
      case Recommendation.maybe:
        icon = const IconData(0x2734);
        break;
      case Recommendation.no:
        icon = const IconData(0x26D4);
        break;
    }
    return ListTile(
      onTap: () => _navigate(context, item.builder),
      leading: Icon(icon),
      title: Text(item.name),
      subtitle: Text(item.type),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  void _navigate(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(MaterialPageRoute(builder: builder));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
