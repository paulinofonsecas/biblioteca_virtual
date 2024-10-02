// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/categorias/cubit/cubit.dart';

void main() {
  group('CategoriasState', () {
    test('supports value equality', () {
      expect(
        CategoriasState(),
        equals(
          const CategoriasState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CategoriasState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const categoriasState = CategoriasState(
            customProperty: 'My property',
          );
          expect(
            categoriasState.copyWith(),
            equals(categoriasState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const categoriasState = CategoriasState(
            customProperty: 'My property',
          );
          final otherCategoriasState = CategoriasState(
            customProperty: 'My property 2',
          );
          expect(categoriasState, isNot(equals(otherCategoriasState)));

          expect(
            categoriasState.copyWith(
              customProperty: otherCategoriasState.customProperty,
            ),
            equals(otherCategoriasState),
          );
        },
      );
    });
  });
}
