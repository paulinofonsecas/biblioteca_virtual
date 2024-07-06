// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/view/admin_view_book_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchedItem extends StatelessWidget {
  const SearchedItem({
    required this.book,
    super.key,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      onTap: () {
        AdminViewBookPage.toScreen(book.id);
      },
      subtitle: Text(book.resumo ?? 'Sem resumo', maxLines: 2),
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
