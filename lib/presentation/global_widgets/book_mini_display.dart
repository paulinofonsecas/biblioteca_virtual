import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
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

  final BookModel book;
  final GestureTapCallback? onTap;

  final double? width;
  final double? height;
  static double widthFactory = .32;
  static double heightFactory = .13;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
        child: SizedBox(
          width: width ?? size.width * widthFactory,
          height: height ?? size.height * heightFactory,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                  child: CachedNetworkImage(
                    imageUrl: book.capa,
                    fit: BoxFit.cover,
                    width: width ?? size.width * widthFactory,
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding / 2),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  book.title.toUpperCase(),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
