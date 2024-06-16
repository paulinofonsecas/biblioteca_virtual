import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/widgets/livros_mais_acessados.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/widgets/todos_os_livros.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/search_books/search_books_widget.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class GestaoDeBooksBody extends StatelessWidget {
  const GestaoDeBooksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  const SearchBooksWidget(),
                  const Gutter(),
                  SectionTitle(
                    title: 'Mais acessados',
                    press: () {},
                  ),
                  const GutterSmall(),
                  const LivrosMaisAcessadosWidget(),
                  const GutterLarge(),
                  const SectionTitle(
                    title: 'Todos os livros',
                  ),
                  const GutterSmall(),
                ],
              ),
            ]),
          ),
          const TodosOsLivrosWidget(),
        ],
      ),
    );
  }
}
