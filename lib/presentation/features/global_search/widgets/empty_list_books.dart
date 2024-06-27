import 'package:flutter/material.dart';

class EmptyListBooks extends StatelessWidget {
  const EmptyListBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nenhum livro encontrado'),
        ],
      ),
    );
  }
}
