// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/bloc/bloc.dart';

void main() {
  group('ListaLeiturasBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ListaLeiturasBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final listaLeiturasBloc = ListaLeiturasBloc();
      expect(listaLeiturasBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ListaLeiturasBloc, ListaLeiturasState>(
      'CustomListaLeiturasEvent emits nothing',
      build: ListaLeiturasBloc.new,
      act: (bloc) => bloc.add(const CustomListaLeiturasEvent()),
      expect: () => <ListaLeiturasState>[],
    );
  });
}
