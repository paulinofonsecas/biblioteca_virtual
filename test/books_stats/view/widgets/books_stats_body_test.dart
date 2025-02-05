// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/books_stats/books_stats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BooksStatsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => BooksStatsCubit(),
          child: MaterialApp(home: BooksStatsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
