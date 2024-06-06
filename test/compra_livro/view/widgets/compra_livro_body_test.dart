// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/compra_livro/compra_livro.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CompraLivroBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CompraLivroBloc(),
          child: MaterialApp(home: CompraLivroBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
