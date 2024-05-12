// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/bloc/bloc.dart';

void main() {
  group('GestaoDeBooksState', () {
    test('supports value equality', () {
      expect(
        GestaoDeBooksState(),
        equals(
          const GestaoDeBooksState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const GestaoDeBooksState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const gestaoDeBooksState = GestaoDeBooksState(
            customProperty: 'My property',
          );
          expect(
            gestaoDeBooksState.copyWith(),
            equals(gestaoDeBooksState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const gestaoDeBooksState = GestaoDeBooksState(
            customProperty: 'My property',
          );
          final otherGestaoDeBooksState = GestaoDeBooksState(
            customProperty: 'My property 2',
          );
          expect(gestaoDeBooksState, isNot(equals(otherGestaoDeBooksState)));

          expect(
            gestaoDeBooksState.copyWith(
              customProperty: otherGestaoDeBooksState.customProperty,
            ),
            equals(otherGestaoDeBooksState),
          );
        },
      );
    });
  });
}
