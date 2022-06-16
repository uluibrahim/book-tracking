import 'package:flutter/material.dart';

class ColorSchemeDark {
  static ColorSchemeDark? _instance;
  static ColorSchemeDark get instance => _instance ??= ColorSchemeDark._init();
  ColorSchemeDark._init();

  final Color greyBlue = const Color.fromARGB(255, 71, 89, 109);
}
