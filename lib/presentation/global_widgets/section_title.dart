import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    this.press,
    super.key,
    this.isMainSection = true,
  });

// Main Section means on Home page section
  final bool isMainSection;
  final String title;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            isMainSection ? title : title.toUpperCase(),
            style: isMainSection
                ? Theme.of(context).textTheme.titleLarge
                : Theme.of(context).textTheme.titleMedium,
          ),
          if (press != null)
            GestureDetector(
              onTap: press,
              child: Text(
                isMainSection ? 'Ver tudo' : 'Limpar tudo'.toUpperCase(),
                style: isMainSection
                    ? Theme.of(context).textTheme.bodyMedium!
                    : const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
              ),
            ),
        ],
      ),
    );
  }
}
