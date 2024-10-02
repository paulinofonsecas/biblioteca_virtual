import 'package:flutter/material.dart';

class CategoriaItem extends StatelessWidget {
  const CategoriaItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox.square(
        dimension: size.width * 0.25,
        child: Container(
          color: Colors.red,
        ));
  }
}
