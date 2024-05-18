import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/autor_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/editora_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/isbn_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_capa_image_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/pick_pdf_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/resumo_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/cubit/titulo_input_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

part 'add_new_book_event.dart';
part 'add_new_book_state.dart';

class AddNewBookBloc extends Bloc<AddNewBookEvent, AddNewBookState> {
  AddNewBookBloc() : super(const AddNewBookInitial()) {
    _booksUseCases = getIt<IBooksUseCases>();
    on<SaveNewBookEvent>(_onSaveNewBookEvent);
  }

  late final IBooksUseCases _booksUseCases;

  FutureOr<void> _onSaveNewBookEvent(
    SaveNewBookEvent event,
    Emitter<AddNewBookState> emit,
  ) async {
    try {
      emit(const SaveNewBookLoading());

      final context = event.context;

      final titulo = context.read<TituloInputCubit>().state.text;
      final autor = context.read<AutorInputCubit>().state.text;
      final isbn = context.read<IsbnInputCubit>().state.text;
      final editora = context.read<EditoraInputCubit>().state.text;
      final resumo = context.read<ResumoInputCubit>().state.text;
      final capa = context.read<PickCapaImageCubit>().state.path;
      final pdf = context.read<PickPDFCubit>().state.path;

      if (capa == null || capa.isEmpty) {
        emit(const SaveNewBookError('Capa não selecionada'));
        return;
      }

      if (pdf == null || pdf.isEmpty) {
        emit(const SaveNewBookError('Arquivo PDF não selecionado'));
        return;
      }

      final newBook = Book(
        id: const Uuid().v4(),
        title: titulo,
        autor: autor,
        isbn: isbn,
        editora: editora,
        resumo: resumo,
        capa: capa,
        pdf: pdf,
      );

      final result = await _booksUseCases.addBook(newBook);

      if (result) {
        emit(const SaveNewBookSuccess());
      } else {
        emit(const SaveNewBookError('Erro ao adicionar o livro'));
      }
    } catch (e) {
      emit(SaveNewBookError('Erro desconhecido\t$e'));
    }
  }
}
