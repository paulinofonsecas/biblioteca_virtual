// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/validate_payment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValidatePaymentBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ValidatePaymentBloc(),
          child: MaterialApp(home: ValidatePaymentBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
