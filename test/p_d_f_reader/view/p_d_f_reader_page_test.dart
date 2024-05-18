// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/p_d_f_reader/p_d_f_reader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PDFReaderPage', () {
    group('route', () {
      test('is routable', () {
        expect(PDFReaderPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders PDFReaderView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: PDFReaderPage()));
      expect(find.byType(PDFReaderView), findsOneWidget);
    });
  });
}
