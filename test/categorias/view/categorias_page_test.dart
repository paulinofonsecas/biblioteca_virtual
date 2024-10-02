// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/categorias/categorias.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoriasPage', () {
    group('route', () {
      test('is routable', () {
        expect(CategoriasPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CategoriasView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CategoriasPage()));
      expect(find.byType(CategoriasView), findsOneWidget);
    });
  });
}
