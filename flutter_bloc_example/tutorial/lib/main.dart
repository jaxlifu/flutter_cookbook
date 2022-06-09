import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/app.dart';
import 'package:flutter_bloc_example/app_observer.dart';
import 'package:flutter_bloc_example/theme/bloc/theme_bloc.dart';
import 'package:logger/logger.dart';

final logger = Logger();

void main(List<String> args) {
  BlocOverrides.runZoned(
    () => runApp(BlocProvider(
      create: (context) => ThemeBloc(),
      child: const BlocApp(),
    )),
    blocObserver: AppBlocObserver(),
  );
}
