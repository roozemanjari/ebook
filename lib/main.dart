import 'package:ebook/screens/homescreen.dart';
import 'package:ebook/view_models/book_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const EBookApp());
}

class EBookApp extends StatelessWidget {
  const EBookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => BookListViewModel(),
        child: const HomePage(),
      ),
    );
  }
}
