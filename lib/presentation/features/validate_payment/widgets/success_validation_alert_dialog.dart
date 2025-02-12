import 'package:bilioteca_virtual/core/util/corrency.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:verify_payment/models/response_model.dart';

class SuccessValidationAlertDialog extends StatelessWidget {
  const SuccessValidationAlertDialog({
    required this.state,
    required this.book,
    super.key,
  });

  final VerifyPaymentSuccess state;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    // print('MyState: $state');
    return AlertDialog(
      title: const Center(
        child: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 42,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _DualValue(
            title: 'Destinatário',
            value: state.bNOME ?? 'Não informado',
          ),
          const GutterSmall(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _DualValue(
                title: 'Valor pago',
                value: normalizePrice(state.dINHEIRO?.toDouble() ?? 0.0),
              ),
              _DualValue(
                title: 'Preço do livro',
                //! fix-me
                value: normalizePrice(book.preco.valor),
                crossAxisAlignment: CrossAxisAlignment.end,
                valueColor: Colors.green,
              ),
            ],
          ),
          const GutterSmall(),
          _DualValue(
            title: 'Data',
            value: state.dATA?.dataHora ?? 'Não informado',
          ),
          const GutterSmall(),
          _DualValue(
            title: 'Banco de origem',
            value: state.bANCO?.toString() ?? 'Não informado',
          ),
          const GutterSmall(),
          _DualValue(
            title: 'Transação',
            value: state.tRANSACAO?.toString() ?? 'Não informado',
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

class _DualValue extends StatelessWidget {
  const _DualValue({
    required this.title,
    required this.value,
    this.crossAxisAlignment,
    this.valueColor,
  });

  final String title;
  final String value;
  final CrossAxisAlignment? crossAxisAlignment;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(title),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
