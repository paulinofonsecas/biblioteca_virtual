// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/bloc/bloc.dart';

void main() {
  group('GestaoDeBooksEvent', () {  
    group('CustomGestaoDeBooksEvent', () {
      test('supports value equality', () {
        expect(
          CustomGestaoDeBooksEvent(),
          equals(const CustomGestaoDeBooksEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomGestaoDeBooksEvent(),
          isNotNull
        );
      });
    });
  });
}
