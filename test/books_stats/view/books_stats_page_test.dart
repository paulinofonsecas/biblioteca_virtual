// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/books_stats/books_stats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BooksStatsPage', () {
    group('route', () {
      test('is routable', () {
        expect(BooksStatsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders BooksStatsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BooksStatsPage()));
      expect(find.byType(BooksStatsView), findsOneWidget);
    });
  });
}
