import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/bottom_sheets/author_info_sheet.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/author_image_avatar_widget.dart';
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
    return InkWell(
      onTap: () {
        AuthorInfoSheetWidget.show(context, author);
      },
      child: Container(
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
              AuthorImageAvatarWidget(imageUrl: author.photo),
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
      ),
    );
  }
}
