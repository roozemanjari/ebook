import 'package:ebook/models/book.dart';

class BookViewModel {
  final Book book;

  BookViewModel(this.book);

  String get coverURL => book.bookImage;

  String get author => book.bookAuthor;

  String get name => book.bookName;

  String get genre => book.bookGenre;

  String get url => book.bookUrl;

  int get price => book.price;

  int get count => book.count;
}
