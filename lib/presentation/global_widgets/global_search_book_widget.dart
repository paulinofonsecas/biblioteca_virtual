import 'package:bilioteca_virtual/presentation/features/global_search/view/global_search_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GlobalSearchBookWidget extends StatelessWidget {
  const GlobalSearchBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => const GlobalSearchPage(),
        );
      },
      icon: const Icon(Icons.search),
    );
  }
}
