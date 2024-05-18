import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/autor_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/editora_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/isbn_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_capa_image_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_pdf_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/resumo_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/titulo_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// {@template add_new_book_page}
/// A description for AddNewBookPage
/// {@endtemplate}
class AddNewBookPage extends StatelessWidget {
  /// {@macro add_new_book_page}
  const AddNewBookPage({super.key});

  /// The static route for AddNewBookPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddNewBookPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNewBookBloc(),
        ),

        //Inputs
        BlocProvider(
          create: (context) => TituloInputCubit(),
        ),
        BlocProvider(
          create: (context) => AutorInputCubit(),
        ),
        BlocProvider(
          create: (context) => IsbnInputCubit(),
        ),
        BlocProvider(
          create: (context) => EditoraInputCubit(),
        ),
        BlocProvider(
          create: (context) => ResumoInputCubit(),
        ),

        // para uploads
        BlocProvider(
          create: (context) => PickCapaImageCubit(),
        ),
        BlocProvider(
          create: (context) => PickPDFCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Adicionar novo Livro'),
            ),
            body: const SafeArea(child: AddNewBookView()),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<AddNewBookBloc>().add(SaveNewBookEvent(context));
              },
              child: const Icon(FontAwesomeIcons.floppyDisk),
            ),
          );
        },
      ),
    );
  }
}

/// {@template add_new_book_view}
/// Displays the Body of AddNewBookView
/// {@endtemplate}
class AddNewBookView extends StatelessWidget {
  /// {@macro add_new_book_view}
  const AddNewBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: AddNewBookBody(),
    );
  }
}
