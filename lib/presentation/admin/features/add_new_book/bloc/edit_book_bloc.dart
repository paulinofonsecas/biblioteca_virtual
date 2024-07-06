import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/preco.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/autor_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/editora_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/isbn_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_capa_image_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_pdf_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/preco_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/resumo_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/titulo_input_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'edit_book_event.dart';
part 'edit_book_state.dart';

class EditBookBloc extends Bloc<EditBookEvent, EditBookState> {
  EditBookBloc() : super(EditBookInitial()) {
    on<UpdateNewBookEvent>(_updateNewBookEvent);
  }

  Future<void> _updateNewBookEvent(
    UpdateNewBookEvent event,
    Emitter<EditBookState> emit,
  ) async {
    try {
      BookModel? bookEdit;

      if (getIt.isRegistered<BookModel>()) {
        bookEdit = getIt.get<BookModel>();
      }

      final booksUseCases = getIt<IBooksUseCases>();
      emit(const EditBookLoading());

      final context = event.context;

      final titulo = context.read<TituloInputCubit>().state.text;
      final autor = context.read<AutorInputCubit>().state.authors;
      final isbn = context.read<IsbnInputCubit>().state.text;
      final editora = context.read<EditoraInputCubit>().state.text;
      final resumo = context.read<ResumoInputCubit>().state.text;
      final capa = context.read<PickCapaImageCubit>().state.path;
      final preco = context.read<PrecoInputCubit>().state.preco;
      var pdf = context.read<PickPDFCubit>().state.path;

      if (capa == null || capa.isEmpty) {
        emit(const EditBookError('Capa não selecionada'));
        return;
      }

      if (bookEdit == null) {
        if (pdf == null || pdf.isEmpty) {
          emit(const EditBookError('Arquivo PDF não selecionado'));
          return;
        }
      }

      if (bookEdit != null) {
        pdf = bookEdit.pdf;
      }

      final newBook = BookModel(
        id: bookEdit?.id ?? const Uuid().v4(),
        title: titulo,
        authors: autor,
        isbn: isbn,
        editora: editora,
        resumo: resumo,
        capa: capa,
        pdf: pdf ?? '',
        preco: Preco(valor: preco),
      );

      final result = await booksUseCases.addBookModel(newBook);

      if (result) {
        emit(const EditBookSuccess());
      } else {
        emit(const EditBookError('Erro ao adicionar o livro'));
      }
    } catch (e) {
      emit(EditBookError('Erro desconhecido\t$e'));
    }
  }
}
