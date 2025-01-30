// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/bloc/bloc.dart';

void main() {
  group('StatsAndReportsBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          StatsAndReportsBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final statsAndReportsBloc = StatsAndReportsBloc();
      expect(statsAndReportsBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<StatsAndReportsBloc, StatsAndReportsState>(
      'CustomStatsAndReportsEvent emits nothing',
      build: StatsAndReportsBloc.new,
      act: (bloc) => bloc.add(const CustomStatsAndReportsEvent()),
      expect: () => <StatsAndReportsState>[],
    );
  });
}
