import 'package:book_tracking/core/extension/context_extensions.dart';
import 'package:book_tracking/product/title_and_description_row.dart';
import 'package:book_tracking/screen/home/model/book.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'custom_image_card.dart';

class BookInfoContainer extends Container {
  final BuildContext context;
  final Book book;

  BookInfoContainer({Key? key, required this.context, required this.book})
      : super(
          key: key,
          padding: context.paddingNormalHorizontal,
          margin: context.paddingLowVertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleAndDescriptionRow(
                  context: context, title: "Yazar", data: book.author ?? ""),
              TitleAndDescriptionRow(
                  context: context, title: "Tür", data: book.genre ?? ""),
              TitleAndDescriptionRow(
                  context: context,
                  title: "Tarih",
                  data: book.published != null
                      ? _formatDate(book.published!)
                      : ""),
              CustomImageCard(context: context, url: book.image!),
            ],
          ),
        );
}

String _formatDate(DateTime date) {
  return DateFormat("dd/MM/yyyy").format(date);
}

