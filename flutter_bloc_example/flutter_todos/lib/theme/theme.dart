import 'package:flutter/material.dart';

class FlutterTodosTheme {
  static const _primaryColor = Color(0xFF13B9FF);

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: _primaryColor,
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: _primaryColor,
        ),
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
        ),
        toggleableActiveColor: _primaryColor,
      );

  static ThemeData get dark => light.copyWith(
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          accentColor: _primaryColor,
        ),
      );
}
