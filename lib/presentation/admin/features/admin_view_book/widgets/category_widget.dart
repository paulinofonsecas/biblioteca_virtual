import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(this.category, {super.key});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding / 1.5,
        vertical: kDefaultPadding / 4,
      ),
      margin: const EdgeInsets.only(
        right: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        border: Border.all(
          color: Colors.amber[700]!,
        ),
      ),
      child: Text(
        category,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
