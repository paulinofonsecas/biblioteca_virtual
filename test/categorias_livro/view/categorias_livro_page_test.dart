// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/categorias_livro.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoriasLivroPage', () {
    group('route', () {
      test('is routable', () {
        expect(CategoriasLivroPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CategoriasLivroView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CategoriasLivroPage()));
      expect(find.byType(CategoriasLivroView), findsOneWidget);
    });
  });
}
