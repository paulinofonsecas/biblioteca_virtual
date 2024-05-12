import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/favorite_books/the_most_wanted_books_widget.dart';
import 'package:flutter/material.dart';

class FavoriteBooksWidget extends StatelessWidget {
  const FavoriteBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Text(
            'Em Destaque',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const TheMostWantedBooksWidget(),
      ],
    );
  }
}
