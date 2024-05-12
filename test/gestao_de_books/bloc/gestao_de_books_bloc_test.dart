// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/bloc/bloc.dart';

void main() {
  group('GestaoDeBooksBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          GestaoDeBooksBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final gestaoDeBooksBloc = GestaoDeBooksBloc();
      expect(gestaoDeBooksBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<GestaoDeBooksBloc, GestaoDeBooksState>(
      'CustomGestaoDeBooksEvent emits nothing',
      build: GestaoDeBooksBloc.new,
      act: (bloc) => bloc.add(const CustomGestaoDeBooksEvent()),
      expect: () => <GestaoDeBooksState>[],
    );
  });
}
