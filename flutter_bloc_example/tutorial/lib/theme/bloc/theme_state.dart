part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState(this.themeData);
  final ThemeData themeData;
  @override
  List<Object> get props => [themeData];
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(ThemeData.dark());
}

class ThemeDark extends ThemeState {
  ThemeDark() : super(ThemeData.dark());
}

class ThemeLight extends ThemeState {
  ThemeLight() : super(ThemeData.light());
}
