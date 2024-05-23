import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
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
          width: width ?? size.width * widthFactory,
          height: height ?? size.height * heightFactory,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                  child: Image.asset(
                    'assets/default_book_cover.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // const SizedBox(height: kDefaultPadding / 2),
              // Text(
              //   book.title,
              //   maxLines: 2,
              //   overflow: TextOverflow.ellipsis,
              //   style: Theme.of(context).textTheme.labelSmall,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
