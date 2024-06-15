// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    required this.categories,
    super.key,
  });

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: categories.map(CategoryWidget.new).toList(),
    );
  }
}
