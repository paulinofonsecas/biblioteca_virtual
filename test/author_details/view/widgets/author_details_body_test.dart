// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/author_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthorDetailsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AuthorDetailsBloc(),
          child: MaterialApp(home: AuthorDetailsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
