// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/bloc/bloc.dart';

void main() {
  group('AddNewBookEvent', () {  
    group('CustomAddNewBookEvent', () {
      test('supports value equality', () {
        expect(
          CustomAddNewBookEvent(),
          equals(const CustomAddNewBookEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomAddNewBookEvent(),
          isNotNull
        );
      });
    });
  });
}
