import 'package:bilioteca_virtual/core/util/messages.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/cubit/featured_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/widgets/generic_home_horizontal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LivrosMaisAcessadosWidget extends StatelessWidget {
  const LivrosMaisAcessadosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.width * .5,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        bloc: context.read<FeaturedBooksCubit>()..getFeaturedBooks(),
        builder: (context, state) {
          if (state is FeaturedBooksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FeaturedBooksError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is FeaturedBooksLoaded) {
            return GenericHomeHorizontalList(state.books);
          }

          return const Text('Erro ao listar os livros mais acessados');
        },
      ),
    );
  }
}
