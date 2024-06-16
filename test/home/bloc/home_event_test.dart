// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/bloc/bloc.dart';

void main() {
  group('HomeEvent', () {  
    group('CustomHomeEvent', () {
      test('supports value equality', () {
        expect(
          CustomHomeEvent(),
          equals(const CustomHomeEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomHomeEvent(),
          isNotNull
        );
      });
    });
  });
}
