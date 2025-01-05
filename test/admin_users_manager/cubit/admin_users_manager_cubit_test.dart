// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/admin_users_manager/cubit/cubit.dart';

void main() {
  group('AdminUsersManagerCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AdminUsersManagerCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final adminUsersManagerCubit = AdminUsersManagerCubit();
      expect(adminUsersManagerCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AdminUsersManagerCubit, AdminUsersManagerState>(
      'yourCustomFunction emits nothing',
      build: AdminUsersManagerCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AdminUsersManagerState>[],
    );
  });
}
