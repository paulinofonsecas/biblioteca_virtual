import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/view/validate_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GlobalValidatePaymentWidget extends StatelessWidget {
  const GlobalValidatePaymentWidget({required this.book, super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => ValidatePaymentPage(book: book),
        );
      },
      icon: const Icon(Icons.verified),
    );
  }
}
