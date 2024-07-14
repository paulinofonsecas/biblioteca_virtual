// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/bloc/bloc.dart';

void main() {
  group('ListaLeiturasState', () {
    test('supports value equality', () {
      expect(
        ListaLeiturasState(),
        equals(
          const ListaLeiturasState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ListaLeiturasState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const listaLeiturasState = ListaLeiturasState(
            customProperty: 'My property',
          );
          expect(
            listaLeiturasState.copyWith(),
            equals(listaLeiturasState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const listaLeiturasState = ListaLeiturasState(
            customProperty: 'My property',
          );
          final otherListaLeiturasState = ListaLeiturasState(
            customProperty: 'My property 2',
          );
          expect(listaLeiturasState, isNot(equals(otherListaLeiturasState)));

          expect(
            listaLeiturasState.copyWith(
              customProperty: otherListaLeiturasState.customProperty,
            ),
            equals(otherListaLeiturasState),
          );
        },
      );
    });
  });
}
