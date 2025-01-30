// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/stats_and_reports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StatsAndReportsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => StatsAndReportsBloc(),
          child: MaterialApp(home: StatsAndReportsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
