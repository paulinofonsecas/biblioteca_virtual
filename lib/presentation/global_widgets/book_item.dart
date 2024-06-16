import 'package:bilioteca_virtual/core/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class BookItem extends StatelessWidget {
  BookItem({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);
  final String img;
  final String title;

  static final uuid = const Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the border radius as needed
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(
          imageUrl: '$img',
          placeholder: (context, url) =>
              const SizedBox(width: 100, child: LoadingWidget()),
          errorWidget: (context, url, error) => Image.asset(
            'assets/images/place.png',
            fit: BoxFit.cover,
          ),
          fit: BoxFit.cover,
          height: 140.0,
        ),
      ),
    );
  }
}
