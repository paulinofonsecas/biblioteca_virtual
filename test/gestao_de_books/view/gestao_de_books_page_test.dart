// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/gestao_de_books.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GestaoDeBooksPage', () {
    group('route', () {
      test('is routable', () {
        expect(GestaoDeBooksPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders GestaoDeBooksView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: GestaoDeBooksPage()));
      expect(find.byType(GestaoDeBooksView), findsOneWidget);
    });
  });
}
