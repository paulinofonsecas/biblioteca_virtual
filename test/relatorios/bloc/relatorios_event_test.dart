// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/relatorios/bloc/bloc.dart';

void main() {
  group('RelatoriosEvent', () {  
    group('CustomRelatoriosEvent', () {
      test('supports value equality', () {
        expect(
          CustomRelatoriosEvent(),
          equals(const CustomRelatoriosEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomRelatoriosEvent(),
          isNotNull
        );
      });
    });
  });
}
