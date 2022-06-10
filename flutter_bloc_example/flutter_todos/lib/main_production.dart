// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/cupertino.dart';
import 'package:flutter_todos/apis/local_storage_todos_api.dart';
import 'package:flutter_todos/apis/todos_api.dart';
import 'package:flutter_todos/app.dart';
import 'package:flutter_todos/bootstrap.dart';
import 'package:flutter_todos/repository/todo_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final TodoApi todoApi =
      LocalStorageTodosApi(plugin: await SharedPreferences.getInstance());
  final repository = TodosRepository(todoApi: todoApi);
  await bootstrap(
    () => App(
      todoRepository: repository,
    ),
  );
}
