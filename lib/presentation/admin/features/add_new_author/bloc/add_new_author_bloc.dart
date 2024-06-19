import 'dart:async';
import 'dart:developer';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/enums.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_author_use_cases.dart';
import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/add_new_book.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'add_new_author_event.dart';
part 'add_new_author_state.dart';

class AddNewAuthorBloc extends Bloc<AddNewAuthorEvent, AddNewAuthorState> {
  AddNewAuthorBloc() : super(const AddNewAuthorInitial()) {
    _authorsUseCases = getIt<IAuthorsUseCases>();
    on<SaveNewAuthorEvent>(_onSaveNewAuthorEvent);
  }

  late final IAuthorsUseCases _authorsUseCases;

  FutureOr<void> _onSaveNewAuthorEvent(
    SaveNewAuthorEvent event,
    Emitter<AddNewAuthorState> emit,
  ) async {
    try {
      emit(const SaveNewAuthorLoading());

      final name = event.name;
      final image = event.path;

      final newToSave = Author(
        id: const Uuid().v4(),
        name: name,
        photo: image,
      );

      if (event.manageMode == ManageMode.add) {
        await _authorsUseCases
            .addAuthor(newToSave)
            .then(
              (value) => emit(const SaveNewAuthorSuccess()),
            )
            .onError(
          (error, stackTrace) {
            log(error.toString());
            emit(
              const SaveNewAuthorError(
                'Ocorreu um erro ao adicionar o autor',
              ),
            );
          },
        );
      } else {
        // await _booksUseCases.updateAuthor(newToSave);
      }
    } catch (e) {
      emit(SaveNewAuthorError('Erro desconhecido\t$e'));
    }
  }
}
