// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/admin_users_manager/admin_users_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdminUsersManagerPage', () {
    group('route', () {
      test('is routable', () {
        expect(AdminUsersManagerPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AdminUsersManagerView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AdminUsersManagerPage()));
      expect(find.byType(AdminUsersManagerView), findsOneWidget);
    });
  });
}
