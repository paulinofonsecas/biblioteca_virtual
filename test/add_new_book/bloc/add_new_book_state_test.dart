// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/bloc/bloc.dart';

void main() {
  group('AddNewBookState', () {
    test('supports value equality', () {
      expect(
        AddNewBookState(),
        equals(
          const AddNewBookState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AddNewBookState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const addNewBookState = AddNewBookState(
            customProperty: 'My property',
          );
          expect(
            addNewBookState.copyWith(),
            equals(addNewBookState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const addNewBookState = AddNewBookState(
            customProperty: 'My property',
          );
          final otherAddNewBookState = AddNewBookState(
            customProperty: 'My property 2',
          );
          expect(addNewBookState, isNot(equals(otherAddNewBookState)));

          expect(
            addNewBookState.copyWith(
              customProperty: otherAddNewBookState.customProperty,
            ),
            equals(otherAddNewBookState),
          );
        },
      );
    });
  });
}
