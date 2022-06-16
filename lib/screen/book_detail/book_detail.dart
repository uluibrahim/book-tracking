import 'package:book_tracking/core/constants/image/image_constants.dart';
import 'package:book_tracking/core/extension/context_extensions.dart';
import 'package:book_tracking/core/init/language/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../product/custom_date_format.dart';
import '../../product/title_and_description_row.dart';
import '../home/model/book.dart';

class BookDetail extends StatelessWidget with CustomDateFormat {
  final Book book;
  const BookDetail({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildImageWitTitle(context),
          Container(
            height: context.height * 0.55,
            width: context.width,
            padding: context.paddingNormal,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: context.height * 0.03),
                  Text(
                    book.description ?? "",
                    style: context.textTheme.bodyLarge,
                  ),
                  SizedBox(height: context.height * 0.08),
                  TitleAndDescriptionRow(
                    context: context,
                    title: LocaleKeys.isbn.tr(),
                    data: book.isbn ?? "",
                    color: Colors.white,
                  ),
                  TitleAndDescriptionRow(
                    context: context,
                    title: LocaleKeys.author.tr(),
                    data: book.author ?? "",
                    color: Colors.white,
                  ),
                  TitleAndDescriptionRow(
                    context: context,
                    title: LocaleKeys.history.tr(),
                    data: book.published != null
                        ? customDateFormat(book.published!)
                        : "",
                    color: Colors.white,
                  ),
                  TitleAndDescriptionRow(
                    context: context,
                    title: LocaleKeys.publisher.tr(),
                    data: book.publisher ?? "",
                    color: Colors.white,
                  ),
                  TitleAndDescriptionRow(
                    context: context,
                    title: LocaleKeys.genre.tr(),
                    data: book.genre ?? "",
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack buildImageWitTitle(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          height: context.height * 0.45,
          width: context.width,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              image(context),
              backButton(context),
            ],
          ),
        ),
        bookTitle(context)
      ],
    );
  }

  SizedBox image(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80)),
        child: FadeInImage.assetNetwork(
          placeholder: ImageConstants.instance.toGif("gif_loading"),
          image: book.image!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Positioned bookTitle(BuildContext context) {
    return Positioned(
      bottom: context.height * 0.04,
      left: context.width * 0.09,
      child: Text(
        book.title ?? "",
        style: context.textTheme.headline4
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Positioned backButton(BuildContext context) {
    return Positioned(
      top: 50,
      child: BackButton(
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
