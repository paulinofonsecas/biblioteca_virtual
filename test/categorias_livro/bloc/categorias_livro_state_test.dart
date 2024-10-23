// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/bloc/bloc.dart';

void main() {
  group('CategoriasLivroState', () {
    test('supports value equality', () {
      expect(
        CategoriasLivroState(),
        equals(
          const CategoriasLivroState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CategoriasLivroState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const categoriasLivroState = CategoriasLivroState(
            customProperty: 'My property',
          );
          expect(
            categoriasLivroState.copyWith(),
            equals(categoriasLivroState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const categoriasLivroState = CategoriasLivroState(
            customProperty: 'My property',
          );
          final otherCategoriasLivroState = CategoriasLivroState(
            customProperty: 'My property 2',
          );
          expect(categoriasLivroState, isNot(equals(otherCategoriasLivroState)));

          expect(
            categoriasLivroState.copyWith(
              customProperty: otherCategoriasLivroState.customProperty,
            ),
            equals(otherCategoriasLivroState),
          );
        },
      );
    });
  });
}
