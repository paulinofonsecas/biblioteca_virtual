// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/bloc/bloc.dart';

void main() {
  group('ValidatePaymentState', () {
    test('supports value equality', () {
      expect(
        ValidatePaymentState(),
        equals(
          const ValidatePaymentState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ValidatePaymentState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const validatePaymentState = ValidatePaymentState(
            customProperty: 'My property',
          );
          expect(
            validatePaymentState.copyWith(),
            equals(validatePaymentState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const validatePaymentState = ValidatePaymentState(
            customProperty: 'My property',
          );
          final otherValidatePaymentState = ValidatePaymentState(
            customProperty: 'My property 2',
          );
          expect(validatePaymentState, isNot(equals(otherValidatePaymentState)));

          expect(
            validatePaymentState.copyWith(
              customProperty: otherValidatePaymentState.customProperty,
            ),
            equals(otherValidatePaymentState),
          );
        },
      );
    });
  });
}
