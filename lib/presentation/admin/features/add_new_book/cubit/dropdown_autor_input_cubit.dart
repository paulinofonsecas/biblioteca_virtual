import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_author_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_autor_input_state.dart';

class DropdownAutorInputCubit extends Cubit<DropdownAutorInputState> {
  DropdownAutorInputCubit() : super(DropdownAutorInputInitial()) {
    _authorsUseCases = getIt<IAuthorsUseCases>();
  }

  late final IAuthorsUseCases _authorsUseCases;

  Future<List<Author>> getAuthors(String text) async {
    return _authorsUseCases.getAuthors().then((authors) => authors);
  }

  void deleteAuthor(String id) {}
}
