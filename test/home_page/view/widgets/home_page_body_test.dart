// ignore_for_file: prefer_const_constructors

import 'package:bilioteca_virtual/presentation/features/home_page/home_page.dart';
import 'package:bilioteca_virtual/presentation/features/home_page/widgets/favorite_books/favorite_books_widget.dart';
import 'package:bilioteca_virtual/presentation/features/home_page/widgets/search_books/search_books_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePageBody', () {
    testWidgets('renders SearchBooksWidget', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => HomePageBloc(),
          child: MaterialApp(home: HomePage()),
        ),
      );

      expect(find.byType(SearchBooksWidget), findsOneWidget);
    });

    testWidgets('renders FavoriteBooksWidget', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => HomePageBloc(),
          child: MaterialApp(home: HomePage()),
        ),
      );

      expect(find.byType(FavoriteBooksWidget), findsOneWidget);
    });
  });
}
