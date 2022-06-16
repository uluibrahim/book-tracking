import 'package:book_tracking/core/init/network/network_manager.dart';
import 'package:book_tracking/screen/home/service/i_home_service.dart';

import '../model/books_model.dart';

class HomeService extends IHomeService {
  
  @override
  Future getBooks(int bookCount) async {
    return NetworkManager.instance!.dioGet(
      "/books?_quantity=$bookCount",
      model: BooksModel(),
    );
  }
}
