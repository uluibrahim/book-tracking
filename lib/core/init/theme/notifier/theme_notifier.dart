import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_theme/app_theme_dark.dart';
import '../app_theme/app_theme_light.dart';

enum AppThemes { dark, light }

class ThemeNotifier extends ChangeNotifier {
  ThemeNotifier() {
    changeValue();
  }
  final _themePreference = "theme_preference";
  ThemeData? _currentTheme;

  ThemeData? get currentTheme => _currentTheme ?? AppThemeLight.instance.theme;

  set currentTheme(ThemeData? currentTheme) {
    _currentTheme = currentTheme;
    notifyListeners();
  }

  AppThemes? _currentThemeEnum;

  AppThemes? get currentThemeEnum => _currentThemeEnum;

  set currentThemeEnum(AppThemes? currenThemeEnum) {
    _currentThemeEnum = currentThemeEnum;
    notifyListeners();
  }

  Future<void> changeValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? prefTheme = sharedPreferences.getInt(_themePreference);
    if (prefTheme == 1 || prefTheme == null) {
      _currentThemeEnum = AppThemes.light;
      _currentTheme = AppThemeLight.instance.theme;
    } else {
      _currentThemeEnum = AppThemes.dark;
      _currentTheme = AppThemeDark.instance.theme;
    }
    notifyListeners();
  }

  Future<void> changeTheme() async {
    if (_currentThemeEnum == AppThemes.light) {
      _currentTheme = AppThemeDark.instance.theme;
      _currentThemeEnum = AppThemes.dark;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currentThemeEnum = AppThemes.light;
    }
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(
        _themePreference, AppThemes.values.indexOf(_currentThemeEnum!));
    notifyListeners();
  }
}
