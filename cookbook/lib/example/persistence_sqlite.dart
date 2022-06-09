import 'dart:io';

import 'package:cookbook/module/dog.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ExamplePersistenceSqlite extends StatefulWidget {
  const ExamplePersistenceSqlite({Key? key}) : super(key: key);

  @override
  State<ExamplePersistenceSqlite> createState() =>
      _ExamplePersistenceSqliteState();
}

class _ExamplePersistenceSqliteState extends State<ExamplePersistenceSqlite> {
  late final Future<Database> _database;
  late Future<List<Dog>> _dogs;

  @override
  void initState() {
    super.initState();
    _database = _openSqlite();
    _dogs = _queryDogs();
  }

  @override
  void dispose() {
    _database.then((db) => db.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showCreateDogDialog(context);
          setState(() {
            _dogs = _queryDogs();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder<List<Dog>>(
            future: _dogs,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              // return Text(snapshot.data.toString());
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final dog = snapshot.data[index];
                    return Dismissible(
                      key: Key(dog.hashCode.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        child: const Text('删除'),
                      ),
                      onDismissed: (direction) async {
                        await _deleteDog(dog.id);
                        // setState(() {
                        //   _dogs = _queryDogs();
                        // });
                      },
                      child: ListTile(
                        title: Text(dog.name),
                        subtitle: Text('I\'m ${dog.age} year old'),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: snapshot.data.length);
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showCreateDogDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('请输入狗狗信息'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: '请输入名字',
                  ),
                ),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: '请输入年龄',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
    if (nameController.text.isEmpty || ageController.text.isEmpty) {
      return;
    }
    final dog = Dog(
      id: DateTime.now().millisecondsSinceEpoch,
      name: nameController.text,
      age: int.parse(ageController.text),
    );
    _insertDog(dog);
  }

  Future<Database> _openSqlite() async {
    late final Database database;
    const dbName = 'doggie_database.db';
    const dbVersion = 1;

    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      database = await databaseFactoryFfi.openDatabase(dbName);
      _createDogTable();
      await database.setVersion(dbVersion);
    } else if (Platform.isIOS || Platform.isAndroid || Platform.isMacOS) {
      WidgetsFlutterBinding.ensureInitialized();
      database = await openDatabase(
        join(await getDatabasesPath(), dbName),
        onCreate: (db, version) {
          _createDogTable();
        },
        version: dbVersion,
      );
    } else {
      throw Exception();
    }
    return database;
  }

  Future<void> _createDogTable() async {
    final db = await _database;
    const sql =
        'CREATE TABLE IF NOT EXISTS dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)';
    await db.execute(sql);
  }

  Future<void> _insertDog(Dog dog) async {
    final db = await _database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> _queryDogs() async {
    final db = await _database;

    final maps = await db.query('dogs');
    return maps
        .map(
          (item) => Dog.fromMap(item),
        )
        .toList();
  }

  Future<void> _updateDog(Dog dog) async {
    final db = await _database;

    await db.update(
      'dogs',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  Future<void> _deleteDog(int id) async {
    final db = await _database;

    await db.delete(
      'dogs',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
