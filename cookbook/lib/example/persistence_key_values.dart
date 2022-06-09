import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const String KEY_COUNTER = "counter";

class ExampleSharedPreferences extends StatefulWidget {
  const ExampleSharedPreferences({Key? key}) : super(key: key);

  @override
  State<ExampleSharedPreferences> createState() =>
      _ExampleSharedPreferencesState();
}

class _ExampleSharedPreferencesState extends State<ExampleSharedPreferences> {
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadCounter() async {
    final prefs = await _prefs;
    setState(() {
      _counter = prefs.getInt(KEY_COUNTER) ?? 0;
    });
  }

  void _incrementCounter() async {
    final prefs = await _prefs;
    setState(() {
      _counter = (prefs.getInt(KEY_COUNTER) ?? 0) + 1;
      prefs.setInt(KEY_COUNTER, _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
      floatingActionButton: _buildFloatActionButton(),
    );
  }

  FloatingActionButton _buildFloatActionButton() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      child: const Icon(Icons.add),
    );
  }

  AppBar _buildAppBar() => AppBar();

  Widget _buildContent() => Center(
        child: Text(
          'button tapped $_counter time${_counter == 1 ? '' : 's'}',
        ),
      );
}
