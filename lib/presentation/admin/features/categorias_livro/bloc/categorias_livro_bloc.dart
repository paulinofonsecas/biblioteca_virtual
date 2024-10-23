import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/domain/use_cases/categoria_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
part 'categorias_livro_event.dart';
part 'categorias_livro_state.dart';

class CategoriasLivroBloc
    extends Bloc<CategoriasLivroEvent, CategoriasLivroState> {
  CategoriasLivroBloc() : super(const CategoriasLivroInitial()) {
    _useCase = getIt<ICategoriaUseCase>();
    on<GetAllCategoriasLivroEvent>(_onCustomCategoriasLivroEvent);
  }
  late ICategoriaUseCase _useCase;

  FutureOr<void> _onCustomCategoriasLivroEvent(
    GetAllCategoriasLivroEvent event,
    Emitter<CategoriasLivroState> emit,
  ) async{
    emit(const GettingCategoriasLivro());
    try {
      await _useCase.getCategories().then((value) {
        value.fold((l) {
          
        }, (r) {
          emit(GettingCategoriasLivroSucess(lista: r));
        },);
      },).onError((error, stackTrace) {
      },);
    } catch (e) {
      emit(const GettingCategoriasError(mensagem: 'Houve aulgum erro!'));
    }
  }
}
