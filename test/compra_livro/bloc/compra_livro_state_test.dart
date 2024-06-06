// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/compra_livro/bloc/bloc.dart';

void main() {
  group('CompraLivroState', () {
    test('supports value equality', () {
      expect(
        CompraLivroState(),
        equals(
          const CompraLivroState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CompraLivroState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const compraLivroState = CompraLivroState(
            customProperty: 'My property',
          );
          expect(
            compraLivroState.copyWith(),
            equals(compraLivroState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const compraLivroState = CompraLivroState(
            customProperty: 'My property',
          );
          final otherCompraLivroState = CompraLivroState(
            customProperty: 'My property 2',
          );
          expect(compraLivroState, isNot(equals(otherCompraLivroState)));

          expect(
            compraLivroState.copyWith(
              customProperty: otherCompraLivroState.customProperty,
            ),
            equals(otherCompraLivroState),
          );
        },
      );
    });
  });
}
