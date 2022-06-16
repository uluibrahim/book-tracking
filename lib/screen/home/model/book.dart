class Book {
  Book({
    this.id,
    this.title,
    this.author,
    this.genre,
    this.description,
    this.isbn,
    this.image,
    this.published,
    this.publisher,
    this.isAdded,
  });

  int? id;
  String? title;
  String? author;
  String? genre;
  String? description;
  String? isbn;
  String? image;
  DateTime? published;
  String? publisher;
  bool? isAdded;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        genre: json["genre"],
        description: json["description"],
        isbn: json["isbn"],
        image: json["image"],
        published: DateTime.tryParse(json["published"]),
        publisher: json["publisher"],
        isAdded: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "genre": genre,
        "description": description,
        "isbn": isbn,
        "image": image,
        "published": published != null
            ? "${published!.year.toString().padLeft(4, '0')}-${published!.month.toString().padLeft(2, '0')}-${published!.day.toString().padLeft(2, '0')}"
            : "",
        "publisher": publisher,
        "isAdded": isAdded,
      };
}
