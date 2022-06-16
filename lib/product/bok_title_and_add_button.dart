import 'package:book_tracking/core/extension/context_extensions.dart';
import 'package:flutter/material.dart';

import '../screen/home/model/book.dart';
import '../screen/home/viewmodel/home_viewmodel.dart';

class BookTitleAndAddButton extends Container {
  final BuildContext context;
  final HomeViewmodel viewmodel;
  final Book book;
  final bool isBookList;

  BookTitleAndAddButton(
      {Key? key,
      required this.context,
      required this.book,
      required this.viewmodel,
      this.isBookList = true})
      : super(
          key: key,
          padding: context.paddingLowHorizontal,
          alignment: Alignment.centerLeft,
          width: context.width,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 71, 89, 109),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: _title(context, book)),
              _button(context, book, viewmodel, isBookList),
            ],
          ),
        );
}

Padding _button(
    BuildContext context, Book book, HomeViewmodel viewmodel, bool isBookList) {
  return Padding(
    padding: context.paddingLow,
    child: ClipOval(
      child: Container(
        color: isBookList
            ? book.isAdded!
                ? Colors.green
                : Colors.blueGrey
            : Colors.red,
        child: IconButton(
          onPressed: () {
            book.isAdded!
                ? viewmodel.removeBookMyBooks(book.id!)
                : viewmodel.addBookMyBooks(book.id!);
          },
          icon: Icon(
            isBookList
                ? book.isAdded!
                    ? Icons.check
                    : Icons.add
                : Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Padding _title(BuildContext context, Book book) {
  return Padding(
    padding: context.paddingLow,
    child: Text(book.title!,
        style: context.textTheme.headline6!.copyWith(color: Colors.white)),
  );
}
