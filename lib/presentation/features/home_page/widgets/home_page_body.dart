import 'package:bilioteca_virtual/presentation/features/home_page/widgets/all_books/all_books_widget.dart';
import 'package:bilioteca_virtual/presentation/features/home_page/widgets/favorite_books/favorite_books_widget.dart';
import 'package:bilioteca_virtual/presentation/features/home_page/widgets/search_books/search_books_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBooksWidget(),
            GutterLarge(),
            FavoriteBooksWidget(),
            GutterLarge(),
            AllBooksWidget(),
          ],
        ),
      ),
    );
  }
}
