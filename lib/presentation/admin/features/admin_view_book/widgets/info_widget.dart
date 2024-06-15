import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .43,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 23, 25, 38),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                // color: Colors.white,
                ),
          ),
          const GutterTiny(),
          Row(
            children: [
              Text(
                'De: ',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    // color: Colors.white,
                    ),
              ),
              Text(
                book.autor,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.amber[700],
                    ),
              ),
            ],
          ),
          const Gutter(),
          DescriptionAreaWidget(
            book: book,
          ),
          const GutterLarge(),
        ],
      ),
    );
  }
}

class DescriptionAreaWidget extends StatelessWidget {
  const DescriptionAreaWidget({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descrição',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                // color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
        Text(
          book.resumo ?? 'Sem qualquer descricão',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Colors.grey[900],
                fontWeight: FontWeight.normal,
              ),
        ),
      ],
    );
  }
}
