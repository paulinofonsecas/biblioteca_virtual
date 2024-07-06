import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class BookDescriptionWidget extends StatelessWidget {
  const BookDescriptionWidget({
    required this.book,
    super.key,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descrição do Livro',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.lightBlue[300],
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Divider(),
          const GutterSmall(),
          Text(
            book.resumo ?? 'Sem descricão',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
