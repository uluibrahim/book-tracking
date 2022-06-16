import 'package:book_tracking/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';

import '../core/constants/image/image_constants.dart';

class CustomImageCard extends Padding {
  final BuildContext context;
  final String url;
  CustomImageCard({Key? key, required this.context, required this.url})
      : super(
          key: key,
          padding: context.paddingNormalVertical,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: SizedBox(
              height: context.height * 0.2,
              width: context.width,
              child: FadeInImage.assetNetwork(
                placeholder: ImageConstants.instance.toGif("gif_loading"),
                image: url,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
}
