import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/author_info_widget.dart';
import 'package:flutter/material.dart';

class AuthorsInfoWidget extends StatelessWidget {
  const AuthorsInfoWidget({required this.book, super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
          ),
          child: Text(
            'Autores',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.lightBlue[300],
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Row(
          children: book.authors
              .map((author) => AuthorInfoWidget(author: author))
              .toList(),
        ),
      ],
    );
  }
}
