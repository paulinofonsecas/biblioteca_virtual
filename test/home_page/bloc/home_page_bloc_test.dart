// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/features/home_page/bloc/bloc.dart';

void main() {
  group('HomePageBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          HomePageBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final homePageBloc = HomePageBloc();
      expect(homePageBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<HomePageBloc, HomePageState>(
      'CustomHomePageEvent emits nothing',
      build: HomePageBloc.new,
      act: (bloc) => bloc.add(const CustomHomePageEvent()),
      expect: () => <HomePageState>[],
    );
  });
}
