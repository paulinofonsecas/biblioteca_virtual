// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/bloc/bloc.dart';

void main() {
  group('StatsAndReportsState', () {
    test('supports value equality', () {
      expect(
        StatsAndReportsState(),
        equals(
          const StatsAndReportsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const StatsAndReportsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const statsAndReportsState = StatsAndReportsState(
            customProperty: 'My property',
          );
          expect(
            statsAndReportsState.copyWith(),
            equals(statsAndReportsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const statsAndReportsState = StatsAndReportsState(
            customProperty: 'My property',
          );
          final otherStatsAndReportsState = StatsAndReportsState(
            customProperty: 'My property 2',
          );
          expect(statsAndReportsState, isNot(equals(otherStatsAndReportsState)));

          expect(
            statsAndReportsState.copyWith(
              customProperty: otherStatsAndReportsState.customProperty,
            ),
            equals(otherStatsAndReportsState),
          );
        },
      );
    });
  });
}
