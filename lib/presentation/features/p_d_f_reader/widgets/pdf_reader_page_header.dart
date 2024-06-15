import 'package:bilioteca_virtual/presentation/global_widgets/brightness_control.dart';
import 'package:flutter/material.dart';

class PDFReaderPageHeader extends StatelessWidget {
  const PDFReaderPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BrightnessControl(),
      ],
    );
  }
}
