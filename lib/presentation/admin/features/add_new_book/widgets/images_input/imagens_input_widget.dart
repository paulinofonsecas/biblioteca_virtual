import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/images_input/capa_input_widget.dart';
import 'package:flutter/material.dart';

class ImagensInputWidget extends StatelessWidget {
  const ImagensInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CapaInputWidget(),
      ],
    );
  }
}
