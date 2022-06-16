import 'package:book_tracking/core/extension/context_extensions.dart';
import 'package:book_tracking/core/init/language/locale_keys.dart';
import 'package:book_tracking/core/init/theme/notifier/theme_notifier.dart';
import 'package:book_tracking/core/navigator/navigator_manager.dart';
import 'package:book_tracking/product/enums/view_state.dart';
import 'package:book_tracking/screen/home/viewmodel/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/component/error/custom_error_widget.dart';
import '../../core/component/indicator/custom_progress_indicator.dart';
import '../../product/bok_title_and_add_button.dart';
import '../../product/book_info_container.dart';
import '../book_detail/book_detail.dart';
import 'package:provider/provider.dart';

class BookList extends StatefulWidget {
  final HomeViewmodel viewmodel;
  const BookList(this.viewmodel, {Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.bookList.tr()),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
            icon: context.watch<ThemeNotifier>().currentThemeEnum ==
                    AppThemes.light
                ? Icon(
                    Icons.wb_sunny,
                    size: context.shortestSide < 600 ? null : 32.0,
                  )
                : Icon(
                    Icons.nightlight,
                    size: context.shortestSide < 600 ? null : 32.0,
                  ),
          ),
        ],
      ),
      body: widget.viewmodel.state == ViewState.idle
          ? buildMyBooks
          : widget.viewmodel.state == ViewState.busy
              ? CustomProgressIndicator(context: context)
              : CustomErrorWidget(context),
    );
  }

  GridView get buildMyBooks => GridView.builder(
        itemCount: widget.viewmodel.booksModel!.book!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.width > 1400
              ? 4
              : context.width > 1100
                  ? 3
                  : context.width > 600
                      ? 2
                      : 1,
        ),
        itemBuilder: (context, index) {
          return buildBookCard(index);
        },
      );

  GestureDetector buildBookCard(int index) {
    return GestureDetector(
      onTap: () {
        navigateToWidget(context,
            BookDetail(book: widget.viewmodel.booksModel!.book![index]));
      },
      child: Container(
        margin: context.paddingNormal,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.blue, spreadRadius: 1.5),
          ],
          color: const Color.fromARGB(255, 245, 240, 240),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BookTitleAndAddButton(
                context: context,
                book: widget.viewmodel.booksModel!.book![index],
                viewmodel: widget.viewmodel,
              ),
              BookInfoContainer(
                  context: context,
                  book: widget.viewmodel.booksModel!.book![index]),
            ],
          ),
        ),
      ),
    );
  }
}
