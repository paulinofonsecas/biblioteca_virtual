// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/p_d_f_reader/p_d_f_reader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PDFReaderBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => PDFReaderBloc(),
          child: MaterialApp(home: PDFReaderBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
