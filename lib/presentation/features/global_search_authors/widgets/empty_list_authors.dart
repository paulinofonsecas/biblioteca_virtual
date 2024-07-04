import 'package:flutter/material.dart';

class EmptyListAuthors extends StatelessWidget {
  const EmptyListAuthors({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nenhum autor encontrado'),
        ],
      ),
    );
  }
}
