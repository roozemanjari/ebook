import 'dart:convert';

import 'package:ebook/models/book.dart';
import 'package:ebook/utils/constants.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<Book>> fetchBooks() async {
    var response = await http.get(Uri.parse(backendURL));

    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);
      return body.map((book) => Book.fromJSON(book)).toList();
    } else {
      throw Exception("Oops! Some error occurred");
    }
  }
}
