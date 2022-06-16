import 'package:book_tracking/core/extension/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../init/language/locale_keys.dart';

class CustomErrorWidget extends Center {
  final BuildContext context;
  CustomErrorWidget(this.context, {Key? key})
      : super(key: key, 
          child: SizedBox(
            width: context.width * 0.85,
            height: context.height * 0.20,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.error_outline,
                      color: context.colors.error, size: 40),
                  Text(LocaleKeys.somethingWentWrong.tr()),
                ],
              ),
            ),
          ),
        );
}
