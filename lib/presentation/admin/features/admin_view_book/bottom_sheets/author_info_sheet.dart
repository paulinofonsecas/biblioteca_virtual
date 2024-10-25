import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/author_image_avatar_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/more_from_autor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class AuthorInfoSheetWidget extends StatelessWidget {
  const AuthorInfoSheetWidget({required this.author, super.key});

  final Author author;

  static Future<void> show(
    BuildContext context,
    Author author,
  ) async {
    showBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) => AuthorInfoSheetWidget(
        author: author,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Gutter(),
            AuthorImageAvatarWidget(
              imageUrl: author.photo,
              radius: 80,
            ),
            const Gutter(),
            Text(
              author.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Gutter(),
            MoreFromAutorWidget(authorId: author.id),
          ],
        ),
      ),
    );
  }
}
