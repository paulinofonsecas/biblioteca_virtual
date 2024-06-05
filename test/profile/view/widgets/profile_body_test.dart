// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/profile/profile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfileBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ProfileBloc(),
          child: MaterialApp(home: ProfileBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
