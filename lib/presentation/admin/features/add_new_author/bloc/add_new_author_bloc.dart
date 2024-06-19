import 'dart:async';

import 'package:bilioteca_virtual/core/util/enums.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/cubit/name_input_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_author/cubit/pick_image_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

part 'add_new_author_event.dart';
part 'add_new_author_state.dart';

class AddNewAuthorBloc extends Bloc<AddNewAuthorEvent, AddNewAuthorState> {
  AddNewAuthorBloc() : super(const AddNewAuthorInitial()) {
    on<SaveNewAuthorEvent>(_onSaveNewAuthorEvent);
  }

  FutureOr<void> _onSaveNewAuthorEvent(
    SaveNewAuthorEvent event,
    Emitter<AddNewAuthorState> emit,
  ) async {
    try {
      emit(const SaveNewAuthorLoading());

      final context = event.context;

      final name = context.read<NameInputCubit>().state.text;
      final image = context.read<PickImageCubit>().state.path;

      if (image == null || image.isEmpty) {
        emit(const SaveNewAuthorError('Imagem não selecionada'));
        return;
      }

      final newToSave = Author(id: const Uuid().v4(), name: name, photo: image);

      if (event.manageMode == ManageMode.add) {
        //   final result = await _booksUseCases.addBook(newAuthor);

        //   if (result) {
        //     emit(const SaveNewAuthorSuccess());
        //   } else {
        //     emit(const SaveNewAuthorError('Erro ao adicionar o livro'));
        //   }
      } else {
        // await _booksUseCases.updateAuthor(newToSave);
      }
    } catch (e) {
      emit(SaveNewAuthorError('Erro desconhecido\t$e'));
    }
  }
}
