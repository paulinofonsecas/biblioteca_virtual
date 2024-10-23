// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/bloc/bloc.dart';

void main() {
  group('CategoriasLivroBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CategoriasLivroBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final categoriasLivroBloc = CategoriasLivroBloc();
      expect(categoriasLivroBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<CategoriasLivroBloc, CategoriasLivroState>(
      'CustomCategoriasLivroEvent emits nothing',
      build: CategoriasLivroBloc.new,
      act: (bloc) => bloc.add(const CustomCategoriasLivroEvent()),
      expect: () => <CategoriasLivroState>[],
    );
  });
}
