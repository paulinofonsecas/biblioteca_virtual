import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/favorite_books/the_most_wanted_books_widget.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/book_mini_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('The Most Wanted Books Widget', () {
    group('constructor and factory', () {
      test('can be instantiated', () {
        expect(
          const TheMostWantedBooksWidget(),
          isNotNull,
        );
      });
    });

    testWidgets('render list of books', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TheMostWantedBooksWidget()),
      );

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('render book widget item', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TheMostWantedBooksWidget()),
      );

      expect(find.byType(BookMiniDisplay), findsWidgets);
    });
  });
}
