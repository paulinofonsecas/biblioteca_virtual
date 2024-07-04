// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/bloc/bloc.dart';

void main() {
  group('GlobalSearchAuthorsState', () {
    test('supports value equality', () {
      expect(
        GlobalSearchAuthorsState(),
        equals(
          const GlobalSearchAuthorsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const GlobalSearchAuthorsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const globalSearchAuthorsState = GlobalSearchAuthorsState(
            customProperty: 'My property',
          );
          expect(
            globalSearchAuthorsState.copyWith(),
            equals(globalSearchAuthorsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const globalSearchAuthorsState = GlobalSearchAuthorsState(
            customProperty: 'My property',
          );
          final otherGlobalSearchAuthorsState = GlobalSearchAuthorsState(
            customProperty: 'My property 2',
          );
          expect(globalSearchAuthorsState, isNot(equals(otherGlobalSearchAuthorsState)));

          expect(
            globalSearchAuthorsState.copyWith(
              customProperty: otherGlobalSearchAuthorsState.customProperty,
            ),
            equals(otherGlobalSearchAuthorsState),
          );
        },
      );
    });
  });
}
