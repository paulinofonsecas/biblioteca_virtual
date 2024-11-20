// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/relatorios/relatorios.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RelatoriosBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => RelatoriosBloc(),
          child: MaterialApp(home: RelatoriosBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
