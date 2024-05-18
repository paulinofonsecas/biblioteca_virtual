import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/autor_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/editora_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/images_input/imagens_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/isbn_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/pdf_input/pdf_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/resumo_input_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/widgets/titulo_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

/*
Título: O nome completo do livro, sem abreviações.
Autor(es): Nome completo do(s) autor(es), incluindo sobrenome e nome.
ISBN: Número Internacional Padrão para Livros. Um código numérico único que identifica cada edição específica de um livro.
Editora: Nome da editora que publicou o livro.
Edição: Número da edição do livro.
Ano de publicação: Ano em que o livro foi publicado.
Idioma: Idioma original do livro.
Gênero: Categoria literária do livro (ficção, não ficção, romance, suspense, etc.).
Resumo: Uma breve descrição do conteúdo do livro.
Palavras-chave: Termos relevantes que ajudam a identificar o livro em pesquisas.
*/

class AddNewBookBody extends StatelessWidget {
  const AddNewBookBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewBookBloc, AddNewBookState>(
      listener: (context, state) async {
        if (state is SaveNewBookLoading) {
          context.loaderOverlay.show();
          return;
        }

        context.loaderOverlay.hide();
      },
      child: const SingleChildScrollView(
        child: Column(
          children: [
            TituloInputWidget(),
            Gutter(),
            AutorInputWidget(),
            Gutter(),
            IsbnInputWidget(),
            Gutter(),
            EditoraInputWidget(),
            Gutter(),
            ResumoInputWidget(),
            GutterLarge(),
            ImagensInputWidget(),
            GutterLarge(),
            PDFInputWidget(),
            GutterLarge(),
          ],
        ),
      ),
    );
  }
}
