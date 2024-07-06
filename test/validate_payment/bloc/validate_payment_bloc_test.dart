// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/bloc/bloc.dart';

void main() {
  group('ValidatePaymentBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ValidatePaymentBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final validatePaymentBloc = ValidatePaymentBloc();
      expect(validatePaymentBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ValidatePaymentBloc, ValidatePaymentState>(
      'CustomValidatePaymentEvent emits nothing',
      build: ValidatePaymentBloc.new,
      act: (bloc) => bloc.add(const CustomValidatePaymentEvent()),
      expect: () => <ValidatePaymentState>[],
    );
  });
}
