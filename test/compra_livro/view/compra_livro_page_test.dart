// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/compra_livro/compra_livro.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CompraLivroPage', () {
    group('route', () {
      test('is routable', () {
        expect(CompraLivroPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CompraLivroView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CompraLivroPage()));
      expect(find.byType(CompraLivroView), findsOneWidget);
    });
  });
}
