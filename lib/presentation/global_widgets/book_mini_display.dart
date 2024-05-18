import 'dart:math';

import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookMiniDisplay extends StatelessWidget {
  const BookMiniDisplay({required this.book, super.key, this.onTap});

  final Book book;
  final GestureTapCallback? onTap;

  static double widthFactory = .32;
  static double heightFactory = .1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (book.capa == '') {
      return Container(
        width: size.width * widthFactory,
        height: size.height * heightFactory,
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

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 3),
        child: SizedBox(
          width: size.width * widthFactory,
          height: size.height * .2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(kDefaultPadding),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: size.height * .2,
                  imageUrl: book.capa,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: kDefaultPadding / 2),
              Text(
                'book.title book.title book.title book.title book.title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
