import 'package:ebook/models/book.dart';
import 'package:ebook/utils/theme.dart';
import 'package:ebook/view_models/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookCover extends StatelessWidget {
  final BookViewModel book;
  final bool isSearch;

  BookCover(this.book, {this.isSearch = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        MaterialButton(
          onPressed: () async {
            await launch(book.url);
          },
          child: Image.network(
            book.coverURL,
            height: 238,
            width: 170,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: 170,
          child: Text(
            "${book.name} BY ${book.author}",
            style: isSearch
                ? BodyTheme.booknameText.copyWith(color: Colors.black)
                : BodyTheme.booknameText,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
