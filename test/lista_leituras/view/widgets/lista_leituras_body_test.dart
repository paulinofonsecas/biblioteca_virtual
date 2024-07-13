// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/lista_leituras.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListaLeiturasBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ListaLeiturasBloc(),
          child: MaterialApp(home: ListaLeiturasBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
