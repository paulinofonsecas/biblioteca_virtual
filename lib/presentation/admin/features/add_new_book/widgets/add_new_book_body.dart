import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/bloc/edit_book_bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/autor_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/editora_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/form_control_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/isbn_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_capa_image_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/preco_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/resumo_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/titulo_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/autor_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/editora_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/images_input/imagens_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/isbn_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/pdf_input/pdf_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/preco_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/resumo_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/titulo_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddNewBookBody extends StatefulWidget {
  const AddNewBookBody({super.key});

  @override
  State<AddNewBookBody> createState() => _AddNewBookBodyState();
}

class _AddNewBookBodyState extends State<AddNewBookBody> {
  @override
  void initState() {
    final book =
        getIt.isRegistered<BookModel>() ? getIt.get<BookModel>() : null;

    final isEditMode = book != null;

    if (isEditMode) {
      context.read<PickCapaImageCubit>().changePath(book.capa);
      context.read<TituloInputCubit>().changeText(book.title);
      context.read<PrecoInputCubit>().precoChanged(book.preco.valor);
      context.read<AutorInputCubit>().changeAuthors(book.authors);
      context.read<IsbnInputCubit>().changeText(book.isbn ?? '');
      context.read<EditoraInputCubit>().changeText(book.editora ?? '');
      context.read<ResumoInputCubit>().changeText(book.resumo ?? '');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddNewBookBloc, AddNewBookState>(
          listener: (context, state) {},
        ),
        BlocListener<EditBookBloc, EditBookState>(
          listener: (context, state) {
            if (state is EditBookLoading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }

            if (state is EditBookSuccess) {
              Navigator.of(context).pop();
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        child: Form(
          key: context.read<FormControlCubit>().formKey,
          child: const Column(
            children: [
              ImagensInputWidget(),
              Gutter(),
              TituloInputWidget(),
              Gutter(),
              PrecoInputWidget(),
              Gutter(),
              AutorInputWidget(),
              Gutter(),
              IsbnInputWidget(),
              Gutter(),
              EditoraInputWidget(),
              Gutter(),
              ResumoInputWidget(),
              Gutter(),
              PDFInputWidget(),
              GutterLarge(),
            ],
          ),
        ),
      ),
    );
  }
}
