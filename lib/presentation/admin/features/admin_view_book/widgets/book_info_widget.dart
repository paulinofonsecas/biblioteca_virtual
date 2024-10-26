import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/core/util/corrency.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/preco.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/categories_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class BookInfoWidget extends StatelessWidget {
  const BookInfoWidget({required this.book, super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.hardEdge,
                child: CachedNetworkImage(
                  imageUrl: book.capa,
                  width: size.width * .4,
                  height: size.height * .3,
                  fit: BoxFit.cover,
                ),
              ),
              const Gutter(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gutter(),
                    Text(
                      book.title,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Row(
                      children: [
                        Text(
                          book.authors.firstOrNull?.name ?? 'N/D',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.grey[500],
                                  ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Seguir',
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                    const Gutter(),
                    Visibility(
                      visible: book.categorias.isNotEmpty,
                      replacement: const Text(
                        'Categoria não atribuida',
                        style: TextStyle(color: Colors.grey),
                      ),
                      child: CategoriesList(
                        categories: book.categorias.map((e) => e.nome).toList(),
                      ),
                    ),
                    const Divider(),
                    const Gutter(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        book.preco == Preco.gratis()
                            ? 'Gratuito'
                            : normalizePrice(book.preco.valor),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.green[600],
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const GutterSmall(),
        ],
      ),
    );
  }
}
