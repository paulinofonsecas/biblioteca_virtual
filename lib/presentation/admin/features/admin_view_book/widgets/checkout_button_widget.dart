import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/cubit/validar_compra_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/view/validate_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:verify_payment/models/response_model.dart';

class CheckoutButtonWidget extends StatelessWidget {
  const CheckoutButtonWidget({required this.book, super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.amber[700],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => const ValidatePaymentPage(),
            isDismissible: false,
          ).then((paymentValidator) {
            if (paymentValidator == null) {
              return;
            }

            context.read<ValidarCompraCubit>().validarPagamento(
                  book,
                  paymentValidator as VerifyPaymentSuccess?,
                );
          });
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.amber[700]),
          foregroundColor: WidgetStateProperty.all(Colors.black),
        ),
        child: const Text('Confirmar Pagamento'),
      ),
    );
  }
}
