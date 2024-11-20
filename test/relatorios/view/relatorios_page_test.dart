// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/relatorios/relatorios.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RelatoriosPage', () {
    group('route', () {
      test('is routable', () {
        expect(RelatoriosPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders RelatoriosView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: RelatoriosPage()));
      expect(find.byType(RelatoriosView), findsOneWidget);
    });
  });
}
