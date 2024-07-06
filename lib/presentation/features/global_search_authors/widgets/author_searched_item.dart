// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/author_details.dart';
import 'package:flutter/material.dart';

class AuthorSearchedItem extends StatelessWidget {
  const AuthorSearchedItem({
    required this.author,
    super.key,
  });

  final Author author;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(author.name),
      onTap: () {
        Navigator.push(context, AuthorDetailsPage.route(author: author));
      },
      // subtitle: Text(book.resumo ?? 'Sem resumo', maxLines: 2),
      // leading: ClipRRect(
      //   borderRadius: BorderRadius.circular(8),
      //   child: CachedNetworkImage(
      //     imageUrl: book.capa,
      //     width: 60,
      //     height: 100,
      //     fit: BoxFit.cover,
      //   ),
      // ),
    );
  }
}
