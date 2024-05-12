import 'dart:math';

import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:flutter/material.dart';

class BookMiniDisplay extends StatelessWidget {
  const BookMiniDisplay({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .32,
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 3),
      decoration: BoxDecoration(
        color: [
          ...Colors.primaries,
          ...Colors.accents,
        ][Random.secure().nextInt(Colors.primaries.length - 1)],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
