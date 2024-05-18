// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/bloc/bloc.dart';

void main() {
  group('AddNewBookBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AddNewBookBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final addNewBookBloc = AddNewBookBloc();
      expect(addNewBookBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<AddNewBookBloc, AddNewBookState>(
      'CustomAddNewBookEvent emits nothing',
      build: AddNewBookBloc.new,
      act: (bloc) => bloc.add(const CustomAddNewBookEvent()),
      expect: () => <AddNewBookState>[],
    );
  });
}
