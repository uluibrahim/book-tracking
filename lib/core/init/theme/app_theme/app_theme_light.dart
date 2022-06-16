import '../light/light_theme.dart';
import 'app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance => _instance ??= AppThemeLight._init();

  AppThemeLight._init();
  @override
  ThemeData get theme => ThemeData.light().copyWith(
        colorScheme: _appColorScheme,
        textTheme: _textTheme,
        appBarTheme: appBarTheme,
        tabBarTheme: tabBarTheme
      );

  TextTheme get _textTheme => ThemeData.light().textTheme.copyWith();

  ColorScheme get _appColorScheme => const ColorScheme.light().copyWith(
        onPrimary: colorSchemeLight!.white,
        onSecondary: colorSchemeLight!.white,
        brightness: Brightness.light,
      );

  AppBarTheme get appBarTheme => AppBarTheme(color: colorSchemeLight?.greyBlue);

  TabBarTheme get tabBarTheme => TabBarTheme(
        labelColor: colorSchemeLight?.blue,
        overlayColor: MaterialStateProperty.all(colorSchemeLight?.black),
        unselectedLabelColor: colorSchemeLight?.grey,
      );
}
