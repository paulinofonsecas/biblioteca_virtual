// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/bloc/bloc.dart';

void main() {
  group('AuthorDetailsBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AuthorDetailsBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final authorDetailsBloc = AuthorDetailsBloc();
      expect(authorDetailsBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<AuthorDetailsBloc, AuthorDetailsState>(
      'CustomAuthorDetailsEvent emits nothing',
      build: AuthorDetailsBloc.new,
      act: (bloc) => bloc.add(const CustomAuthorDetailsEvent()),
      expect: () => <AuthorDetailsState>[],
    );
  });
}
