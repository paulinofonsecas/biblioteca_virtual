import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/core/util/snackbar_message.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/bloc/edit_book_bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/autor_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/categoria_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/dropdown_autor_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/editora_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/form_control_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/isbn_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_capa_image_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_pdf_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/preco_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/resumo_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/titulo_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

/// {@template add_new_book_page}
/// A description for AddNewBookPage
/// {@endtemplate}
class AddNewBookPage extends StatefulWidget {
  /// {@macro add_new_book_page}
  const AddNewBookPage({super.key, this.book});

  final BookModel? book;

  /// The static route for AddNewBookPage
  static Route<dynamic> route({BookModel? book}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => AddNewBookPage(
        book: book,
      ),
    );
  }

  @override
  State<AddNewBookPage> createState() => _AddNewBookPageState();
}

class _AddNewBookPageState extends State<AddNewBookPage> {
  @override
  void initState() {
    if (widget.book != null) {
      if (getIt.isRegistered<BookModel>()) {
        getIt.unregister<BookModel>();
      }

      getIt.registerSingleton<BookModel>(widget.book!);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (getIt.isRegistered<BookModel>()) {
      getIt.unregister<BookModel>();
    }
    super.dispose();
  }

  void onTap(BuildContext context) {
    if (context.read<FormControlCubit>().formKey.currentState!.validate()) {
      if (widget.book != null) {
        context.read<EditBookBloc>().add(UpdateNewBookEvent(context));
      } else {
        context.read<AddNewBookBloc>().add(SaveNewBookEvent(context));
      }
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
    final isEditMode = widget.book != null;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNewBookBloc(),
        ),
        BlocProvider(
          create: (context) => EditBookBloc(),
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
          create: (context) => CategoriaInputCubit(),
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
        BlocProvider(
          create: (context) => PrecoInputCubit(),
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
                SnackBarMessage.showSuccessSnackBar(
                  message: 'Livro salvo com sucesso',
                  context: context,
                );
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
                title: Text(isEditMode ? 'Editar Livro' : 'Novo Livro'),
                actions: [
                  TextButton.icon(
                    onPressed: () {
                      onTap(context);
                    },
                    icon: const Icon(FontAwesomeIcons.floppyDisk),
                    label: Text(isEditMode ? 'Atualizar' : 'Salvar'),
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
