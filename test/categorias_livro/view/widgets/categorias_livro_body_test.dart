// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/categorias_livro.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoriasLivroBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CategoriasLivroBloc(),
          child: MaterialApp(home: CategoriasLivroBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
