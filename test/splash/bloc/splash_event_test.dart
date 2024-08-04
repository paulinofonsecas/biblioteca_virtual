// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/splash/bloc/bloc.dart';

void main() {
  group('SplashEvent', () {  
    group('CustomSplashEvent', () {
      test('supports value equality', () {
        expect(
          CustomSplashEvent(),
          equals(const CustomSplashEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomSplashEvent(),
          isNotNull
        );
      });
    });
  });
}
