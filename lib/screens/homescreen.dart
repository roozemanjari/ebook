import 'dart:ui';

import 'package:ebook/screens/genre_screen.dart';
import 'package:ebook/screens/search_screen.dart';
import 'package:ebook/utils/constants.dart';
import 'package:ebook/utils/theme.dart';
import 'package:ebook/view_models/book_list_view_model.dart';
import 'package:ebook/widgets/book_cover.dart';
import 'package:ebook/widgets/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  final ScrollController _scrollController = ScrollController();
  int page = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<BookListViewModel>(context, listen: false).populateData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final vm = Provider.of<BookListViewModel>(context);
    return _getWidget(vm, size);
  }

  _getWidget(BookListViewModel vm, Size size) {
    switch (vm.status) {
      case STATUS.SUCCESS:
        return _getSuccessPage(vm, size);
      case STATUS.LOADING:
        return const Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        );
      case STATUS.FAILURE:
        return const Center(
          child: Text("Oops! Some error occurred"),
        );
    }
  }

  Widget _getSuccessPage(BookListViewModel vm, Size size) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Rooze's Bookstore",
          style: AppbarTheme.appBarHeading,
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 800),
                curve: Curves.ease,
              );
            },
            child: Text(
              "HOME",
              style: AppbarTheme.textbutton,
            ),
          ),
          const SizedBox(width: 40.0),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              _scrollController.animateTo(
                1300,
                duration: const Duration(milliseconds: 800),
                curve: Curves.ease,
              );
            },
            child: Text(
              "GENRES",
              style: AppbarTheme.textbutton,
            ),
          ),
          const SizedBox(width: 40.0),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              _scrollController.animateTo(
                2000,
                duration: const Duration(milliseconds: 800),
                curve: Curves.ease,
              );
            },
            child: Text(
              "ABOUT US",
              style: AppbarTheme.textbutton,
            ),
          ),
          const SizedBox(width: 40.0),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.zero,
            child: TextFormField(
              onFieldSubmitted: (String searchKeyword) {
                // Open Search Screen
                if (searchKeyword.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        searchKeyword: searchKeyword,
                        vm: vm,
                      ),
                    ),
                  );
                }
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                suffixIcon: Icon(Icons.search),
                hintText: "Search",
              ),
            ),
          ),
          const SizedBox(width: 40.0),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: MaterialButton(
              onPressed: () {
                showLoginDialog(context);
              },
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                  "LOG IN",
                  style: AppbarTheme.authbutton,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: 695.0,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/background.jpg",
                        fit: BoxFit.cover,
                        height: 695.0,
                        width: size.width,
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                        child: Container(
                          width: size.width,
                          height: 695.0,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: size.width,
                        height: 148,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Today a ",
                                  style: BodyTheme.sloganTextBlack,
                                ),
                                TextSpan(
                                  text: "READER",
                                  style: BodyTheme.sloganTextMaroon,
                                ),
                                TextSpan(
                                  text: ", tomorrow a ",
                                  style: BodyTheme.sloganTextBlack,
                                ),
                                TextSpan(
                                  text: "LEADER",
                                  style: BodyTheme.sloganTextMaroon,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 399,
                        width: size.width,
                        color: primaryColor,
                        child: Stack(
                          children: [
                            PageView(
                              controller: _pageController,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 200),
                                  width: size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      for (int i = 0; i < 3; i++)
                                        BookCover(vm.books[i]),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 200),
                                  width: size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      for (int i = 3; i < 6; i++)
                                        BookCover(vm.books[i]),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 175,
                              left: 50,
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: MaterialButton(
                                  onPressed: () {
                                    if (page == 1) {
                                      setState(() {
                                        page = 0;
                                      });
                                      _pageController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 800),
                                        curve: Curves.ease,
                                      );
                                    }
                                  },
                                  shape: const CircleBorder(),
                                  color: page == 1
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.3),
                                  child: const Icon(
                                    Icons.chevron_left_rounded,
                                    color: primaryColor,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            page == 0
                                ? Positioned(
                                    top: 175,
                                    right: 50,
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (page == 0) {
                                            setState(() {
                                              page = 1;
                                            });
                                            _pageController.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 800),
                                              curve: Curves.ease,
                                            );
                                          }
                                        },
                                        shape: const CircleBorder(),
                                        color: page == 0
                                            ? Colors.white
                                            : Colors.white.withOpacity(0.3),
                                        child: const Icon(
                                          Icons.chevron_right_rounded,
                                          color: primaryColor,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: primaryColor,
              width: size.width,
              height: 600,
              child: Column(
                children: [
                  const SizedBox(height: 51),
                  Container(
                    width: 320,
                    height: 46,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "MOST POPULAR",
                        style: BodyTheme.sloganTextMaroon,
                      ),
                    ),
                  ),
                  const SizedBox(height: 51),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 200.0),
                    child: SizedBox(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BookCover(vm.books[1]),
                          BookCover(vm.books[3]),
                          BookCover(vm.books[5]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              color: secondaryColor,
              child: Column(
                children: [
                  const SizedBox(height: 51),
                  Container(
                    width: 180,
                    height: 46,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "GENRES",
                        style: BodyTheme.sloganTextMaroon.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 51),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    width: size.width,
                    child: Wrap(
                      spacing: 40,
                      runSpacing: 30,
                      children: [
                        for (int i = 0; i < genres.length; i++)
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GenreScreen(
                                    genre: genres[i],
                                    vm: vm,
                                  ),
                                ),
                              );
                            },
                            child: Chip(
                              backgroundColor: primaryColor.withOpacity(0.39),
                              labelPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 70.0,
                              ),
                              label: Text(
                                genres[i],
                                style: BodyTheme.genresNameText,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 51),
                ],
              ),
            ),
            Container(
              color: secondaryColor,
              height: 471.0,
              width: size.width,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/bg2.png",
                    fit: BoxFit.cover,
                    width: size.width,
                    height: 471.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 320,
                        height: 46,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "ABOUT US",
                            style: BodyTheme.sloganTextMaroon.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 51),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 81),
                        child: Text(
                          aboutUsText,
                          style: BodyTheme.aboutUsText,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    child: SizedBox(
                      width: size.width,
                      height: 25,
                      child: Center(
                        child: Text(
                          copyrightText,
                          style: BodyTheme.copyrightText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
