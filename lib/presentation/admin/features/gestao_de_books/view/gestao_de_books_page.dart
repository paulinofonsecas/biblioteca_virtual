import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/cubit/all_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/cubit/featured_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/widgets/gestao_de_books_body.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/brightness_control.dart';
import 'package:flutter/material.dart';

class GestaoDeBooksPage extends StatelessWidget {
  const GestaoDeBooksPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const GestaoDeBooksPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GestaoDeBooksBloc(),
        ),
        BlocProvider(
          create: (context) => AllBooksCubit(),
        ),
        BlocProvider(
          create: (context) => FeaturedBooksCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestão de livros'),
          actions: const [
            BrightnessControl(),
          ],
        ),
        body: const GestaoDeBooksView(),
      ),
    );
  }
}

class GestaoDeBooksView extends StatelessWidget {
  const GestaoDeBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GestaoDeBooksBody();
  }
}
