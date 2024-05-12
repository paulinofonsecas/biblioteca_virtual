// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/gestao_de_books.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GestaoDeBooksBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => GestaoDeBooksBloc(),
          child: MaterialApp(home: GestaoDeBooksBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
