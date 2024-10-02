// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/categorias/categorias.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoriasBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CategoriasCubit(),
          child: MaterialApp(home: CategoriasBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
