// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/bloc/bloc.dart';

void main() {
  group('ValidatePaymentEvent', () {  
    group('CustomValidatePaymentEvent', () {
      test('supports value equality', () {
        expect(
          CustomValidatePaymentEvent(),
          equals(const CustomValidatePaymentEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomValidatePaymentEvent(),
          isNotNull
        );
      });
    });
  });
}
