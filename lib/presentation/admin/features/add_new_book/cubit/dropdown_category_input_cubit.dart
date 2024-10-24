import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/domain/use_cases/categoria_use_case.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_author_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_category_input_state.dart';

class DropdownCategoryInputCubit extends Cubit<DropdownCategoryInputState> {
  DropdownCategoryInputCubit() : super(DropdownCategoryInputInitial()) {
    _useCases = getIt<ICategoriaUseCase>();
  }

  late final ICategoriaUseCase _useCases;

  Future<List<Categoria>> getList(String text) async {
    return _useCases.getCategories().then((lista) => lista.getOrElse(() => []));
  }

  void deleteAuthor(String id) {}
}
