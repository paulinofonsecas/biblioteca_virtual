// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddNewBookBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AddNewBookBloc(),
          child: MaterialApp(home: AddNewBookBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
