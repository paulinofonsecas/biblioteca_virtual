// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/bloc/bloc.dart';

void main() {
  group('AuthorDetailsState', () {
    test('supports value equality', () {
      expect(
        AuthorDetailsState(),
        equals(
          const AuthorDetailsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AuthorDetailsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const authorDetailsState = AuthorDetailsState(
            customProperty: 'My property',
          );
          expect(
            authorDetailsState.copyWith(),
            equals(authorDetailsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const authorDetailsState = AuthorDetailsState(
            customProperty: 'My property',
          );
          final otherAuthorDetailsState = AuthorDetailsState(
            customProperty: 'My property 2',
          );
          expect(authorDetailsState, isNot(equals(otherAuthorDetailsState)));

          expect(
            authorDetailsState.copyWith(
              customProperty: otherAuthorDetailsState.customProperty,
            ),
            equals(otherAuthorDetailsState),
          );
        },
      );
    });
  });
}
