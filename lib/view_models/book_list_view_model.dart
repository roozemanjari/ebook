import 'package:ebook/models/book.dart';
import 'package:ebook/service/webservice.dart';
import 'package:ebook/view_models/book_view_model.dart';
import 'package:flutter/foundation.dart';

enum STATUS { LOADING, SUCCESS, FAILURE }

class BookListViewModel extends ChangeNotifier {
  List<BookViewModel> books = [];
  STATUS status = STATUS.LOADING;

  Future<void> populateData() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      List<Book> _books = await WebService().fetchBooks();
      books.clear();
      books = _books.map((book) => BookViewModel(book)).toList();
      status = STATUS.SUCCESS;
      notifyListeners();
    } catch (e) {
      status = STATUS.FAILURE;
      notifyListeners();
    }
  }

  Future<List<BookViewModel>> search(String keyword) async {
    await Future.delayed(const Duration(seconds: 2));

    return books
        .where((book) =>
            book.name.toLowerCase().contains(keyword.toLowerCase()) ||
            book.author.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  Future<List<BookViewModel>> searchGenre(String genre) async {
    await Future.delayed(const Duration(seconds: 2));

    return books
        .where(
          (book) => book.genre.toLowerCase().contains(
                genre.toLowerCase(),
              ),
        )
        .toList();
  }
}
