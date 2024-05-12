import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBooksWidget extends StatelessWidget {
  const SearchBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      child: TextField(
        onChanged: (value) {
          context.read<SearchBooksCubit>().changeWord(value);
        },
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {
              context.read<SearchBooksCubit>().searchBooks();
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 16,
            ),
          ),
          hintText: 'Pesquisar livros',
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(kDefaultPadding / 2),
          ),
        ),
      ),
    );
  }
}
