import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/form_control_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/autor_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/editora_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/images_input/imagens_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/isbn_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/pdf_input/pdf_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/resumo_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/titulo_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class AddNewBookBody extends StatelessWidget {
  const AddNewBookBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: context.read<FormControlCubit>().formKey,
        child: const Column(
          children: [
            ImagensInputWidget(),
            Gutter(),
            TituloInputWidget(),
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
    );
  }
}
