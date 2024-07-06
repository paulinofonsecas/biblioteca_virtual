// ignore_for_file: prefer_const_constructors

import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/author_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthorDetailsPage', () {
    group('route', () {
      test('is routable', () {
        expect(AuthorDetailsPage.route(author: Author.nullo()),
            isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AuthorDetailsView', (tester) async {
      // await tester.pumpWidget(MaterialApp(home: AuthorDetailsPage()));
      expect(find.byType(AuthorDetailsView), findsOneWidget);
    });
  });
}
