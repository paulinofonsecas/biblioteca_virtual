// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/bloc/bloc.dart';

void main() {
  group('GlobalSearchAuthorsBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          GlobalSearchAuthorsBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final globalSearchAuthorsBloc = GlobalSearchAuthorsBloc();
      expect(globalSearchAuthorsBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<GlobalSearchAuthorsBloc, GlobalSearchAuthorsState>(
      'CustomGlobalSearchAuthorsEvent emits nothing',
      build: GlobalSearchAuthorsBloc.new,
      act: (bloc) => bloc.add(const CustomGlobalSearchAuthorsEvent()),
      expect: () => <GlobalSearchAuthorsState>[],
    );
  });
}
