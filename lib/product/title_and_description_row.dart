import 'package:book_tracking/core/extension/context_extensions.dart';
import 'package:book_tracking/core/init/theme/notifier/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleAndDescriptionRow extends Padding {
  final String title;
  final String data;
  final BuildContext context;
  final Color color;
  TitleAndDescriptionRow({
    Key? key,
    required this.context,
    required this.data,
    required this.title,
    this.color = Colors.black,
  }) : super(
          key: key,
          padding: context.paddingLowVertical * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$title \t:\t", style: _style(context, color)),
              Flexible(child: Text(data, style: _style(context, color))),
            ],
          ),
        );
}

TextStyle _style(BuildContext context, Color color) =>
    context.textTheme.titleLarge!.copyWith(
      fontSize: 16.0,
      color: context.watch<ThemeNotifier>().currentThemeEnum == AppThemes.light
          ? Colors.black
          : color,
    );
