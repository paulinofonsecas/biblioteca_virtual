import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/book_medium_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookMiniDisplay extends StatelessWidget {
  const BookMiniDisplay({
    required this.book,
    super.key,
    this.onTap,
    this.width,
    this.height,
  });

  final Book book;
  final GestureTapCallback? onTap;

  final double? width;
  final double? height;
  static double widthFactory = .32;
  static double heightFactory = .1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
          child: SizedBox(
              child: BookItem(
                  img: book.capa, title: 'title')),
        ));
  }
}
