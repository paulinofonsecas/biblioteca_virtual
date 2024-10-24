import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/core/util/helpers_functions.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class AuthorInfoWidget extends StatelessWidget {
  const AuthorInfoWidget({
    required this.author,
    super.key,
  });

  final Author author;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
        horizontal: kDefaultPadding / 4,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 2,
          horizontal: kDefaultPadding / 5,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CircleAvatar(
                radius: 25,
                child: CachedNetworkImage(
                  imageUrl: getValidImagePath(author.photo),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const GutterSmall(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  author.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
