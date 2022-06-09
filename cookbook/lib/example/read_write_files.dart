import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ReadWriteFiles extends StatefulWidget {
  ReadWriteFiles({
    Key? key,
  }) : super(key: key);

  final CounterStorage storage = CounterStorage();

  @override
  State<ReadWriteFiles> createState() => _ReadWriteFilesState();
}

class _ReadWriteFilesState extends State<ReadWriteFiles> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });
    return widget.storage.writeCounter(_counter);
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

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    final file = await _localFile;
    final contents = await file.readAsString();
    return int.tryParse(contents) ?? 0;
  }
}
