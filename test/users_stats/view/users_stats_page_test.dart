// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/users_stats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsersStatsPage', () {
    group('route', () {
      test('is routable', () {
        expect(UsersStatsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders UsersStatsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: UsersStatsPage()));
      expect(find.byType(UsersStatsView), findsOneWidget);
    });
  });
}
