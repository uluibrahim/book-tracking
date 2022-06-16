import 'package:book_tracking/core/init/language/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

mixin TabItems {
  final List<Tab> myTabs = [
    Tab(text: LocaleKeys.bookList.tr(), icon: const Icon(Icons.book)),
    Tab(text: LocaleKeys.myBooks.tr(), icon: const Icon(Icons.bookmark_add_outlined)),
  ];
  
}
