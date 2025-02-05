// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/cubit/cubit.dart';

void main() {
  group('UsersStatsCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          UsersStatsCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final usersStatsCubit = UsersStatsCubit();
      expect(usersStatsCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<UsersStatsCubit, UsersStatsState>(
      'yourCustomFunction emits nothing',
      build: UsersStatsCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <UsersStatsState>[],
    );
  });
}
