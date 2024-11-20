// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/relatorios/bloc/bloc.dart';

void main() {
  group('RelatoriosState', () {
    test('supports value equality', () {
      expect(
        RelatoriosState(),
        equals(
          const RelatoriosState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const RelatoriosState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const relatoriosState = RelatoriosState(
            customProperty: 'My property',
          );
          expect(
            relatoriosState.copyWith(),
            equals(relatoriosState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const relatoriosState = RelatoriosState(
            customProperty: 'My property',
          );
          final otherRelatoriosState = RelatoriosState(
            customProperty: 'My property 2',
          );
          expect(relatoriosState, isNot(equals(otherRelatoriosState)));

          expect(
            relatoriosState.copyWith(
              customProperty: otherRelatoriosState.customProperty,
            ),
            equals(otherRelatoriosState),
          );
        },
      );
    });
  });
}
