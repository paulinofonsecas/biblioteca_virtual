import 'package:bilioteca_virtual/presentation/admin/features/home/widgets/livros_mais_acessados.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class AventuraSection extends StatelessWidget {
  const AventuraSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Aventura',
          press: () {},
        ),
        const GutterSmall(),
        const LivrosMaisAcessadosWidget(),
      ],
    );
  }
}
