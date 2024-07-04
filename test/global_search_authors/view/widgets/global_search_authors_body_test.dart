// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/global_search_authors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GlobalSearchAuthorsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => GlobalSearchAuthorsBloc(),
          child: MaterialApp(home: GlobalSearchAuthorsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
