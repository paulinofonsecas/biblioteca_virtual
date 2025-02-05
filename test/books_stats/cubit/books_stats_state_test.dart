// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/books_stats/cubit/cubit.dart';

void main() {
  group('BooksStatsState', () {
    test('supports value equality', () {
      expect(
        BooksStatsState(),
        equals(
          const BooksStatsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const BooksStatsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const booksStatsState = BooksStatsState(
            customProperty: 'My property',
          );
          expect(
            booksStatsState.copyWith(),
            equals(booksStatsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const booksStatsState = BooksStatsState(
            customProperty: 'My property',
          );
          final otherBooksStatsState = BooksStatsState(
            customProperty: 'My property 2',
          );
          expect(booksStatsState, isNot(equals(otherBooksStatsState)));

          expect(
            booksStatsState.copyWith(
              customProperty: otherBooksStatsState.customProperty,
            ),
            equals(otherBooksStatsState),
          );
        },
      );
    });
  });
}
