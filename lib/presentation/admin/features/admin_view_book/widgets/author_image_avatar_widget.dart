import 'package:bilioteca_virtual/core/util/helpers_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AuthorImageAvatarWidget extends StatelessWidget {
  const AuthorImageAvatarWidget({
    required this.imageUrl,
    super.key,
    this.radius,
  });

  final String? imageUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 25),
      child: CircleAvatar(
        radius: radius ?? 25,
        child: SizedBox(
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: getValidImagePath(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
