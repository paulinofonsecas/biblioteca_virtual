import 'package:bilioteca_virtual/presentation/client/features/home_page/view/home_page.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/search_books/search_books_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  group('Search Books Widget', () {
    testWidgets('render SearchBooksWidget', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.byType(SearchBooksWidget), findsOneWidget);
    });

    group('Search input', () {
      testWidgets('render search input', (tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));

        expect(find.byType(SearchBooksWidget), findsOneWidget);
        expect(find.byType(TextField), findsOneWidget);
      });

      testWidgets('render search input button', (tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));

        expect(find.byType(SearchBooksWidget), findsOneWidget);
        expect(
          find.byIcon(
            FontAwesomeIcons.magnifyingGlass,
          ),
          findsOneWidget,
        );
      });
    });
  });
}
