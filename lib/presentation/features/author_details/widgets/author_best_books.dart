import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/book_mini_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class AuthorBestBooks extends StatelessWidget {
  const AuthorBestBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gutter(),
          const Text(
            'Livros mais vendidos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const GutterSmall(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .25,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              separatorBuilder: (context, index) => const Gutter(),
              itemBuilder: (context, index) => BookMiniDisplay(
                onTap: () {},
                book: Book.nullo(),
              ),
            ),
          ),
          const GutterLarge(),
        ],
      ),
    );
  }
}
