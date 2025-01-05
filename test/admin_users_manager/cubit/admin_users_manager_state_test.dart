// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:bilioteca_virtual/presentation/admin/admin_users_manager/cubit/cubit.dart';

void main() {
  group('AdminUsersManagerState', () {
    test('supports value equality', () {
      expect(
        AdminUsersManagerState(),
        equals(
          const AdminUsersManagerState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AdminUsersManagerState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const adminUsersManagerState = AdminUsersManagerState(
            customProperty: 'My property',
          );
          expect(
            adminUsersManagerState.copyWith(),
            equals(adminUsersManagerState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const adminUsersManagerState = AdminUsersManagerState(
            customProperty: 'My property',
          );
          final otherAdminUsersManagerState = AdminUsersManagerState(
            customProperty: 'My property 2',
          );
          expect(adminUsersManagerState, isNot(equals(otherAdminUsersManagerState)));

          expect(
            adminUsersManagerState.copyWith(
              customProperty: otherAdminUsersManagerState.customProperty,
            ),
            equals(otherAdminUsersManagerState),
          );
        },
      );
    });
  });
}
