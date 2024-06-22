import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/autor_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/dropdown_autor_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/editora_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/form_control_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/isbn_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_capa_image_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_pdf_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/resumo_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/titulo_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

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

  void onTap(BuildContext context) {
    if (context.read<FormControlCubit>().formKey.currentState!.validate()) {
      context.read<AddNewBookBloc>().add(SaveNewBookEvent(context));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNewBookBloc(),
        ),
        BlocProvider(
          create: (context) => DropdownAutorInputCubit(),
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
        BlocProvider(
          create: (context) => FormControlCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<AddNewBookBloc, AddNewBookState>(
            listener: (context, state) {
              if (state is SaveNewBookLoading) {
                context.loaderOverlay.show();
              } else {
                context.loaderOverlay.hide();
              }

              if (state is SaveNewBookSuccess) {
                Navigator.of(context).pop();
              }

              if (state is SaveNewBookError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Novo Livro'),
                actions: [
                  TextButton.icon(
                    onPressed: () {
                      onTap(context);
                    },
                    icon: const Icon(FontAwesomeIcons.floppyDisk),
                    label: const Text('Salvar'),
                  ),
                ],
              ),
              body: const SafeArea(child: AddNewBookView()),
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
