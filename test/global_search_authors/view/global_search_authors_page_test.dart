// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/global_search_authors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GlobalSearchAuthorsPage', () {
    group('route', () {
      test('is routable', () {
        expect(GlobalSearchAuthorsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders GlobalSearchAuthorsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: GlobalSearchAuthorsPage()));
      expect(find.byType(GlobalSearchAuthorsView), findsOneWidget);
    });
  });
}
