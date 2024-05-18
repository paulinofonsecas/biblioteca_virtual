import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:flutter/material.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
