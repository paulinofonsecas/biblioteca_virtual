import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/domain/use_cases/categoria_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'categorias_livro_event.dart';
part 'categorias_livro_state.dart';

class CategoriasLivroBloc
    extends Bloc<CategoriasLivroEvent, CategoriasLivroState> {   
  CategoriasLivroBloc() : super(const CategoriasLivroInitial()) {
    _useCase = getIt<ICategoriaUseCase>();
    on<GetAllCategoriasLivroEvent>(_onGetAllCategoriasLivroEvent);
    on<RemoveCategoriaLivroEvent>(_onRemoveCategory);
    on<AdiconarCategoriaLivroEvent>(_onAdicionarCategory);
  }
  late List<Categoria> listaCategoriasCache;
  late ICategoriaUseCase _useCase;

  FutureOr<void> _onGetAllCategoriasLivroEvent(
    GetAllCategoriasLivroEvent event,
    Emitter<CategoriasLivroState> emit,
  ) async {
    emit(const GettingCategoriasLivro());
    try {
      await _useCase.getCategories().then(
        (value) {
          value.fold(
            (l) {},
            (r) {
              listaCategoriasCache = r;
              emit(GettingCategoriasLivroSucess(lista: r));
            },
          );
        },
      ).onError(
        (error, stackTrace) {},
      );
    } catch (e) {
      emit(const GettingCategoriasError(mensagem: 'Houve aulgum erro!'));
    }
  }

  FutureOr<void> _onRemoveCategory(
    RemoveCategoriaLivroEvent event,
    Emitter<CategoriasLivroState> emit,
  ) async {
    try {
      emit(const GettingCategoriasLivro());
      await _useCase.deleteCategory(event.item.id);
      event.lista.removeWhere(
        (element) => element.id == event.item.id,
      );
      listaCategoriasCache = event.lista;
      emit(GettingCategoriasLivroSucess(lista: event.lista));
    } catch (e) {
      emit(const GettingCategoriasError(mensagem: 'Houve aulgum erro!'));
    }
  }
  
  FutureOr<void> _onAdicionarCategory(
    AdiconarCategoriaLivroEvent event,
    Emitter<CategoriasLivroState> emit,
  ) async {
    try {
      emit(const GettingCategoriasLivro());
      await _useCase.adcionarCategoria(event.item);
      listaCategoriasCache.add(event.item);
      emit(GettingCategoriasLivroSucess(lista: listaCategoriasCache));
    } catch (e) {
      emit(const GettingCategoriasError(mensagem: 'Houve aulgum erro!'));
    }
  }
}
