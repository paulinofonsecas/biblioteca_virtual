import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/book_mini_display.dart';
import 'package:flutter/material.dart';

class DiscoveryBooksWidget extends StatelessWidget {
  const DiscoveryBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 60,
      itemBuilder: (context, index) {
        return BookMiniDisplay(
          book: Book.nullo(),
        );
      },
    );
  }
}
