// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/relatorios/bloc/bloc.dart';

void main() {
  group('RelatoriosBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          RelatoriosBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final relatoriosBloc = RelatoriosBloc();
      expect(relatoriosBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<RelatoriosBloc, RelatoriosState>(
      'CustomRelatoriosEvent emits nothing',
      build: RelatoriosBloc.new,
      act: (bloc) => bloc.add(const CustomRelatoriosEvent()),
      expect: () => <RelatoriosState>[],
    );
  });
}
