import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/cubit/get_books_from_author_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/view/admin_view_book_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class MoreFromAutorWidget extends StatelessWidget {
  const MoreFromAutorWidget({required this.authorId, super.key});

  final String authorId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetBooksFromAuthorCubit, GetBooksFromAuthorState>(
      listener: (context, state) {
        if (state is GetBooksFromAuthorError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Mais do autor',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.lightBlue[300],
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(),
            const GutterSmall(),
            BlocBuilder<GetBooksFromAuthorCubit, GetBooksFromAuthorState>(
              bloc: context.read<GetBooksFromAuthorCubit>()
                ..getBooksFromAuthor(authorId),
              builder: (context, state) {
                if (state is GetBooksFromAuthorLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is GetBooksFromAuthorError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is GetBooksFromAuthorLoaded) {
                  final books = state.books;

                  if (books.isEmpty) {
                    return const Center(
                      child: Text('Não ha mais livros deste autor'),
                    );
                  }

                  return Column(
                    children: List.generate(
                      books.length,
                      (index) {
                        final localBook = books[index];

                        return MoreBookForAuthorWidget(
                          book: localBook,
                        );
                      },
                    ).toList(),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MoreBookForAuthorWidget extends StatelessWidget {
  const MoreBookForAuthorWidget({
    required this.book,
    super.key,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          // ignore: inference_failure_on_instance_creation
          MaterialPageRoute(
            builder: (context) =>
                AdminViewBookPage(bookId: book.id, parent: 'parent'),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * .02,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kDefaultPadding),
                child: book.capa.isNotEmpty && book.capa.contains('http')
                    ? Image.network(
                        book.capa,
                        width: 100,
                        height: 150,
                      )
                    : Image.asset(
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
                    book.authors.firstOrNull?.name ?? 'N/D',
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
      ),
    );
  }
}
