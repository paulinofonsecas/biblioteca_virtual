// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/books_stats/cubit/cubit.dart';

void main() {
  group('BooksStatsCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          BooksStatsCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final booksStatsCubit = BooksStatsCubit();
      expect(booksStatsCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<BooksStatsCubit, BooksStatsState>(
      'yourCustomFunction emits nothing',
      build: BooksStatsCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <BooksStatsState>[],
    );
  });
}
