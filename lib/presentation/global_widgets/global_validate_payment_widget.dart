import 'package:bilioteca_virtual/presentation/features/validate_payment/view/validate_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GlobalValidatePaymentWidget extends StatelessWidget {
  const GlobalValidatePaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => const ValidatePaymentPage(),
        );
      },
      icon: const Icon(Icons.verified),
    );
  }
}
