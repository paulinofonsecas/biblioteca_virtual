// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/lista_leituras.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListaLeiturasPage', () {
    group('route', () {
      test('is routable', () {
        expect(ListaLeiturasPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ListaLeiturasView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ListaLeiturasPage()));
      expect(find.byType(ListaLeiturasView), findsOneWidget);
    });
  });
}
