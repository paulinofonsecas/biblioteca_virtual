// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddNewBookPage', () {
    group('route', () {
      test('is routable', () {
        expect(AddNewBookPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AddNewBookView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddNewBookPage()));
      expect(find.byType(AddNewBookView), findsOneWidget);
    });
  });
}
