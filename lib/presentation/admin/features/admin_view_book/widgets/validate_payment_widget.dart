import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ValidatePaymentWidget extends StatelessWidget {
  const ValidatePaymentWidget({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.info, color: Colors.red[300]),
            const GutterTiny(),
            Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red[400],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Text(
            'Após o pagamento, deverá enviar o comprovativo pelo campos abaixo'
            ' e assim o livro será liberado'),
        const Gutter(),
        Align(
          alignment: Alignment.topCenter,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.upload_file),
            onPressed: () {},
            label: const Text('Carregar comprovativo'),
          ),
        ),
      ],
    );
  }
}
