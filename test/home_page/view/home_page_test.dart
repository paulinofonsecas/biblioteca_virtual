// ignore_for_file: prefer_const_constructors, strict_raw_type

import 'package:bilioteca_virtual/presentation/client/features/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePagePage', () {
    group('route', () {
      test('is routable', () {
        expect(HomePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders HomePageView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePage()));
      expect(find.byType(HomePageView), findsOneWidget);
    });
  });
}
