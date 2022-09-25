import 'package:ebook/utils/constants.dart';
import 'package:ebook/view_models/book_list_view_model.dart';
import 'package:ebook/view_models/book_view_model.dart';
import 'package:ebook/widgets/book_cover.dart';
import 'package:flutter/material.dart';

class GenreScreen extends StatefulWidget {
  final String genre;
  final BookListViewModel vm;
  const GenreScreen({
    Key? key,
    required this.genre,
    required this.vm,
  }) : super(key: key);

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  bool isLoading = true;
  List<BookViewModel> books = [];

  @override
  void initState() {
    super.initState();
    search();
  }

  search() async {
    books = await widget.vm.searchGenre(widget.genre);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(widget.genre),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : _showUI(),
    );
  }

  _showUI() {
    if (books.isEmpty) {
      return Center(
        child: Text(
          "No books found in ${widget.genre} genre",
          style: const TextStyle(fontSize: 26),
        ),
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "${books.length} books found in ${widget.genre}",
            style: const TextStyle(fontSize: 26),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: Container(
              // padding: const EdgeInsets.symmetric(horizontal: 70),
              color: secondaryColor,
              child: GridView.builder(
                itemCount: books.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) => Container(
                  child: BookCover(
                    books[index],
                    isSearch: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
