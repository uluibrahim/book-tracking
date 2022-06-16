import 'package:book_tracking/locator.dart';
import 'package:book_tracking/screen/home/model/book.dart';
import 'package:book_tracking/screen/home/service/home_service.dart';
import 'package:flutter/material.dart';

import '../../../product/enums/view_state.dart';
import '../model/books_model.dart';

class HomeViewmodel with ChangeNotifier implements HomeService {
  final _service = locator<HomeService>();

  ViewState _state = ViewState.busy;
  ViewState get state => _state;
  set state(ViewState state) {
    _state = state;
    notifyListeners();
  }

  int countBook;
  HomeViewmodel(this.countBook) {
    getBooks(countBook);
  }

  BooksModel? booksModel;

  @override
  Future getBooks(int bookCount) async {
    try {
      booksModel = await _service.getBooks(bookCount);
      if (booksModel?.code == 200) {
        state = ViewState.idle;
      }
    } catch (e) {
      state = ViewState.error;
    }
  }

  List<Book> myBooks = [];

  bool addBookMyBooks(int id) {
    int length = myBooks.length;

    Iterable<Book> result =
        booksModel!.book!.where((element) => element.id == id);

    myBooks.add(result.single);
    result.single.isAdded = true;
    notifyListeners();
    return length < myBooks.length ? true : false;
  }

  bool removeBookMyBooks(int id) {
    int length = myBooks.length;
    Iterable<Book> result =
        booksModel!.book!.where((element) => element.id == id);
    myBooks.remove(result.single);
    result.single.isAdded = false;

    notifyListeners();
    return length > myBooks.length ? true : false;
  }

  void myBooksInsert(int index) {
    if (index != dropValue) {
      Book newItem = myBooks[index];
      myBooks.removeAt(index);
      myBooks.insert(dropValue, newItem);
      notifyListeners();
    }
    dropValue = 0;
  }

  int _dropValue = 0;
  int get dropValue => _dropValue;
  set dropValue(int dropValue) {
    _dropValue = dropValue;
    notifyListeners();
  }
}
