import 'package:ebook/utils/constants.dart';
import 'package:ebook/view_models/book_list_view_model.dart';
import 'package:ebook/view_models/book_view_model.dart';
import 'package:ebook/widgets/book_cover.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String searchKeyword;
  final BookListViewModel vm;
  const SearchScreen({Key? key, required this.searchKeyword, required this.vm})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isLoading = true;
  List<BookViewModel> books = [];

  @override
  void initState() {
    super.initState();
    search();
  }

  search() async {
    books = await widget.vm.search(widget.searchKeyword);
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
        title: Text(widget.searchKeyword),
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
          "No results found for your search: ${widget.searchKeyword}",
          style: const TextStyle(fontSize: 26),
        ),
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "${books.length} search results found",
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
