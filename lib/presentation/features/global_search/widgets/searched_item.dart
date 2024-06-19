// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchedItem extends StatelessWidget {
  const SearchedItem({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      onTap: () {
        context.go(
          Uri(
            path: '/admin/view-book',
            queryParameters: {
              'bookId': book.id,
              'parent': '/admin/home-page',
            },
          ).toString(),
        );
      },
      subtitle: Text(book.resumo ?? 'Sem resumo'),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: book.capa,
          width: 60,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
