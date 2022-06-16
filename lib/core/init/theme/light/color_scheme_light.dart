import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight get instance =>
      _instance ??= ColorSchemeLight._init();
  ColorSchemeLight._init();

  final Color white = const Color(0xffffffff);
  final Color greyBlue = const Color.fromARGB(255, 71, 89, 109);
  final Color blue = Colors.blue;
  final Color black = Colors.black;
  final Color grey = Colors.grey;
}
