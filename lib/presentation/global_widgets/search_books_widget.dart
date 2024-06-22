import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        onChanged: (value) {
          if (widget.onChangeWord != null) {
            widget.onChangeWord!.call(value);
          }
        },
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {
              if (widget.onSearch != null) {
                widget.onSearch!.call(_controller.text);
              }
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 16,
            ),
          ),
          hintText: 'Pesquisar livros',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kDefaultPadding / 2),
          ),
        ),
      ),
    );
  }
}
