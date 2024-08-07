import 'package:bilioteca_virtual/presentation/features/global_search_authors/view/global_search_authors_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GlobalSearchAuthorsWidget extends StatelessWidget {
  const GlobalSearchAuthorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => const GlobalSearchAuthorsPage(),
        );
      },
      icon: const Icon(Icons.search),
    );
  }
}
