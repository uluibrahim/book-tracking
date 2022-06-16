import 'package:book_tracking/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends Padding {
  final BuildContext context;
  CustomProgressIndicator({Key? key, required this.context})
      : super(
          key: key,
          padding: context.paddingNormal,
          child: const Center(
              child: LinearProgressIndicator(backgroundColor: Colors.orange)),
        );
}
