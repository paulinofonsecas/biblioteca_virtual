// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/cubit/cubit.dart';

void main() {
  group('UsersStatsState', () {
    test('supports value equality', () {
      expect(
        UsersStatsState(),
        equals(
          const UsersStatsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const UsersStatsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const usersStatsState = UsersStatsState(
            customProperty: 'My property',
          );
          expect(
            usersStatsState.copyWith(),
            equals(usersStatsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const usersStatsState = UsersStatsState(
            customProperty: 'My property',
          );
          final otherUsersStatsState = UsersStatsState(
            customProperty: 'My property 2',
          );
          expect(usersStatsState, isNot(equals(otherUsersStatsState)));

          expect(
            usersStatsState.copyWith(
              customProperty: otherUsersStatsState.customProperty,
            ),
            equals(otherUsersStatsState),
          );
        },
      );
    });
  });
}
