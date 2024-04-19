// ignore_for_file: prefer_const_constructors

import 'package:bilioteca_virtual/presentation/features/login/bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          LoginBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final loginBloc = LoginBloc();
      expect(loginBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<LoginBloc, LoginState>(
      'CustomLoginEvent emits nothing',
      build: LoginBloc.new,
      act: (bloc) => bloc.add(const CustomLoginEvent()),
      expect: () => <LoginState>[],
    );
  });
}
