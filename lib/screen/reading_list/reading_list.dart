import 'package:book_tracking/core/extension/context_extensions.dart';
import 'package:book_tracking/core/init/language/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/component/error/custom_error_widget.dart';
import '../../core/component/indicator/custom_progress_indicator.dart';
import '../../product/bok_title_and_add_button.dart';
import '../../product/book_info_container.dart';
import '../../product/enums/view_state.dart';
import '../home/viewmodel/home_viewmodel.dart';

class ReadingList extends StatefulWidget {
  final HomeViewmodel viewmodel;
  const ReadingList(this.viewmodel, {Key? key}) : super(key: key);

  @override
  State<ReadingList> createState() => _ReadingListState();
}

class _ReadingListState extends State<ReadingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.myBooks.tr())),
      body: widget.viewmodel.state == ViewState.idle
          ? widget.viewmodel.myBooks.isNotEmpty
              ? buildMyBooks
              : Center(child: Text(LocaleKeys.thereAreNoBooksOnYourList.tr()))
          : widget.viewmodel.state == ViewState.busy
              ? CustomProgressIndicator(context: context)
              : CustomErrorWidget(context),
    );
  }

  GridView get buildMyBooks => GridView.builder(
        itemCount: widget.viewmodel.myBooks.length,
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

  Container buildBookCard(int index) {
    return Container(
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
              book: widget.viewmodel.myBooks[index],
              viewmodel: widget.viewmodel,
              isBookList: false,
            ),
            GestureDetector(
              onLongPress: () {
                selectNewPosition(index);
              },
              child: BookInfoContainer(
                  context: context, book: widget.viewmodel.myBooks[index]),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> selectNewPosition(int index) async {
    return await showDialog(
      context: context,
      builder: (alertIndex) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(LocaleKeys.selectTheLocationYouWantToMove.tr()),
              content: DropdownButton<int>(
                value: widget.viewmodel.dropValue,
                items: List.generate(
                  widget.viewmodel.myBooks.length,
                  (index) => DropdownMenuItem(
                    value: index,
                    child: Text((index + 1).toString()),
                  ),
                ),
                onChanged: (value) {
                  setState(() => widget.viewmodel.dropValue = value ?? 0);
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(LocaleKeys.cancel.tr()),
                ),
                TextButton(
                  onPressed: () {
                    widget.viewmodel.myBooksInsert(index);
                    Navigator.pop(context);
                  },
                  child: Text(LocaleKeys.reorder.tr()),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
