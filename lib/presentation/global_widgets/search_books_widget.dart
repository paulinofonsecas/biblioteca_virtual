import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/features/global_search/view/global_search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SearchBooksWidget extends StatefulWidget {
  const SearchBooksWidget({
    this.onSearch,
    this.onChangeWord,
    super.key,
  });

  final void Function(String)? onSearch;
  final void Function(String)? onChangeWord;

  @override
  State<SearchBooksWidget> createState() => _SearchBooksWidgetState();
}

class _SearchBooksWidgetState extends State<SearchBooksWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      child: TextField(
        controller: _controller,
        canRequestFocus: false,
        onTap: () {
          showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => const GlobalSearchPage(),
          );
        },
        decoration: const InputDecoration(
          prefix: Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 16,
            ),
          ),
          hintText: 'Pesquisar livros',
        ),
      ),
    );
  }
}
