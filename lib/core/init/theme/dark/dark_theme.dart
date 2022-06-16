import 'package:book_tracking/core/init/theme/dark/color_scheme_dark.dart';
import 'package:book_tracking/core/init/theme/dark/text_theme_dark.dart';

abstract class IDarkTheme {
  TextThemeDark? get textThemeDark => TextThemeDark.instance;
  ColorSchemeDark? get colorSchemeDark => ColorSchemeDark.instance;
}
