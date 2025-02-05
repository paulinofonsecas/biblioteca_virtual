// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/users_stats.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsersStatsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => UsersStatsCubit(),
          child: MaterialApp(home: UsersStatsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
