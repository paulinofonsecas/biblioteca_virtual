import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/core/util/snackbar_message.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/cubit/validar_comprovativo_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/validate_payment.dart';
import 'package:bilioteca_virtual/presentation/features/validate_payment/widgets/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ValidatePaymentBody extends StatelessWidget {
  const ValidatePaymentBody({required this.book, super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ValidarComprovativoCubit, ValidarComprovativoState>(
      listener: (context, state) {
        if (state is ValidarComprovativoError) {
          SnackBarMessage.showErrorSnackBar(
            message: state.message,
            context: context,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              'Validação comprovativo',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  const GutterLarge(),
                  VerifyPaymentActions(book),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
