// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/bloc/bloc.dart';

void main() {
  group('AuthorDetailsEvent', () {  
    group('CustomAuthorDetailsEvent', () {
      test('supports value equality', () {
        expect(
          CustomAuthorDetailsEvent(),
          equals(const CustomAuthorDetailsEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomAuthorDetailsEvent(),
          isNotNull
        );
      });
    });
  });
}
