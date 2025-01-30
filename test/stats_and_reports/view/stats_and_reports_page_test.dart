// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/stats_and_reports.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StatsAndReportsPage', () {
    group('route', () {
      test('is routable', () {
        expect(StatsAndReportsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders StatsAndReportsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: StatsAndReportsPage()));
      expect(find.byType(StatsAndReportsView), findsOneWidget);
    });
  });
}
