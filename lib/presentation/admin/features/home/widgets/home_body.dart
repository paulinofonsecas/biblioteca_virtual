import 'package:bilioteca_virtual/presentation/admin/features/home/widgets/livros_mais_acessados.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/widgets/todos_os_livros.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/cubit/search_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/search_books_widget.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

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
                  SearchBooksWidget(
                    onSearch: (value) {
                      context.read<SearchBooksCubit>().searchBooks(value);
                    },
                    onChangeWord: (value) {
                      context.read<SearchBooksCubit>().onChangeWord(value);
                    },
                  ),
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
