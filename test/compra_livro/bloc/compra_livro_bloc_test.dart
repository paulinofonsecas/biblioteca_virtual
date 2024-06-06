// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/compra_livro/bloc/bloc.dart';

void main() {
  group('CompraLivroBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CompraLivroBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final compraLivroBloc = CompraLivroBloc();
      expect(compraLivroBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<CompraLivroBloc, CompraLivroState>(
      'CustomCompraLivroEvent emits nothing',
      build: CompraLivroBloc.new,
      act: (bloc) => bloc.add(const CustomCompraLivroEvent()),
      expect: () => <CompraLivroState>[],
    );
  });
}
