import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class InLineBookMediumDisplay extends StatelessWidget {
  const InLineBookMediumDisplay({
    required this.book,
    required this.onTap,
    super.key,
    this.trailing,
  });

  final BookModel book;
  final VoidCallback onTap;
  static double widthFactory = .32;
  static double heightFactory = .1;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(kDefaultPadding),
                // child: Image.asset(
                //   'assets/default_book_cover.jpg',
                //   width: 80,
                //   height: 100,
                //   fit: BoxFit.cover,
                // ),
                child: CachedNetworkImage(
                  imageUrl: book.capa,
                  width: 80,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const Gutter(),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // const Gutter(),
                      Text(
                        book.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(book.authors.firstOrNull?.name ?? 'N/D'),
                    ],
                  ),
                ),
              ),
              const Gutter(),
              trailing ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
