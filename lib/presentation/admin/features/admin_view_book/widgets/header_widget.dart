import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(FontAwesomeIcons.arrowLeft),
          ),
          const Spacer(),
          const Icon(FontAwesomeIcons.bookmark),
        ],
      ),
    );
  }
}
