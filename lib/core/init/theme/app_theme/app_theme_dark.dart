import 'package:flutter/material.dart';

import '../dark/dark_theme.dart';
import 'app_theme.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance => _instance ??= AppThemeDark._init();

  AppThemeDark._init();
  @override
  ThemeData get theme => ThemeData.dark().copyWith(
      colorScheme: _appColorScheme,
      textTheme: _textTheme,
      progressIndicatorTheme: progressIndicatorThemeData,
      appBarTheme: appBarTheme);
  AppBarTheme get appBarTheme => AppBarTheme(color: colorSchemeDark?.greyBlue);

  ProgressIndicatorThemeData get progressIndicatorThemeData =>
      ProgressIndicatorThemeData(color: _appColorScheme.background);

  TextTheme get _textTheme => ThemeData.dark().textTheme.copyWith();

  ColorScheme get _appColorScheme => const ColorScheme.dark().copyWith();
}
