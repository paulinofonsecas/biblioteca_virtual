// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/categorias/cubit/cubit.dart';

void main() {
  group('CategoriasCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CategoriasCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final categoriasCubit = CategoriasCubit();
      expect(categoriasCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<CategoriasCubit, CategoriasState>(
      'yourCustomFunction emits nothing',
      build: CategoriasCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <CategoriasState>[],
    );
  });
}
