import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class MoreFromAutorWidget extends StatelessWidget {
  const MoreFromAutorWidget({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Mais sobre o autor',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.lightBlue[300],
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Divider(),
          const GutterSmall(),
          Column(
            children: List.generate(
              5,
              (_) => MoreBookForAuthorWidget(
                book: book,
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class MoreBookForAuthorWidget extends StatelessWidget {
  const MoreBookForAuthorWidget({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * .02,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kDefaultPadding),
              child: Image.asset(
                'assets/default_book_cover.jpg',
                width: 100,
                height: 150,
              ),
            ),
          ),
          const GutterSmall(),
          Flexible(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  book.autor,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.blue[400],
                      ),
                ),
                const GutterSmall(),
                Text(
                  book.resumo ?? 'Sem descricão',
                  maxLines: 3,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.grey[500],
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
