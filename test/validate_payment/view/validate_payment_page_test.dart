// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/validate_payment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValidatePaymentPage', () {
    group('route', () {
      test('is routable', () {
        expect(ValidatePaymentPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ValidatePaymentView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ValidatePaymentPage()));
      expect(find.byType(ValidatePaymentView), findsOneWidget);
    });
  });
}
