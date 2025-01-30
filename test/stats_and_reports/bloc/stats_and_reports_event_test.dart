// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/bloc/bloc.dart';

void main() {
  group('StatsAndReportsEvent', () {  
    group('CustomStatsAndReportsEvent', () {
      test('supports value equality', () {
        expect(
          CustomStatsAndReportsEvent(),
          equals(const CustomStatsAndReportsEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomStatsAndReportsEvent(),
          isNotNull
        );
      });
    });
  });
}
