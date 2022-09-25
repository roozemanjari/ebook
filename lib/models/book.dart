class Book {
  final String bookImage, bookAuthor, bookName, bookGenre, bookUrl;
  final int price, count;

  Book({
    required this.bookImage,
    required this.bookAuthor,
    required this.bookName,
    required this.bookGenre,
    required this.bookUrl,
    required this.price,
    required this.count,
  });

  factory Book.fromJSON(Map json) {
    return Book(
      bookImage: json["bookImage"],
      bookAuthor: json["bookAuthor"],
      bookName: json["bookName"],
      bookGenre: json["bookGenre"],
      bookUrl: json["bookUrl"],
      price: json["price"],
      count: json["count"],
    );
  }
}
