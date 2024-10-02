import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/view/admin_view_book_page.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/book_mini_display.dart';
import 'package:flutter/material.dart';

class GenericHomeHorizontalList extends StatelessWidget {
  const GenericHomeHorizontalList(this.books, {super.key});

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];

        return BookMiniDisplay(
          onTap: () {
            AdminViewBookPage.toScreen(book.id);
          },
          book: BookModel(
            id: book.id,
            title: book.title,
            authors: book.authors,
            capa: book.capa,
            pdf: book.pdf,
            preco: book.preco,
          ),
        );
      },
    );
  }
}
