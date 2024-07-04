// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/bloc/bloc.dart';

void main() {
  group('GlobalSearchAuthorsEvent', () {  
    group('CustomGlobalSearchAuthorsEvent', () {
      test('supports value equality', () {
        expect(
          CustomGlobalSearchAuthorsEvent(),
          equals(const CustomGlobalSearchAuthorsEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomGlobalSearchAuthorsEvent(),
          isNotNull
        );
      });
    });
  });
}
