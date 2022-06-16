import 'package:book_tracking/core/base/base_model.dart';
import 'book.dart';

class BooksModel extends BaseModel {
  BooksModel({
    this.status,
    this.code,
    this.total,
    this.book,
  });

  String? status;
  int? code;
  int? total;
  List<Book>? book;

  @override
  fromJson(Map<String, dynamic> map) => BooksModel(
        status: map["status"],
        code: map["code"],
        total: map["total"],
        book: List<Book>.from(map["data"].map((x) => Book.fromJson(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "status": status,
        "code": code,
        "total": total,
        "data": List<dynamic>.from(book!.map((x) => x.toJson())),
      };
}
