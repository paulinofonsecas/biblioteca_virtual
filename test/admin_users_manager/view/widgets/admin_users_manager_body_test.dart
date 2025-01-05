// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/admin_users_manager/admin_users_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdminUsersManagerBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AdminUsersManagerCubit(),
          child: MaterialApp(home: AdminUsersManagerBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
