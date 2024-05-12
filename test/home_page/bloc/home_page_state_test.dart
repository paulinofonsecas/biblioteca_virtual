// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/home_page/bloc/bloc.dart';

void main() {
  group('HomePageState', () {
    test('supports value equality', () {
      expect(
        HomePageState(),
        equals(
          const HomePageState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const HomePageState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const homePageState = HomePageState(
            customProperty: 'My property',
          );
          expect(
            homePageState.copyWith(),
            equals(homePageState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const homePageState = HomePageState(
            customProperty: 'My property',
          );
          final otherHomePageState = HomePageState(
            customProperty: 'My property 2',
          );
          expect(homePageState, isNot(equals(otherHomePageState)));

          expect(
            homePageState.copyWith(
              customProperty: otherHomePageState.customProperty,
            ),
            equals(otherHomePageState),
          );
        },
      );
    });
  });
}
