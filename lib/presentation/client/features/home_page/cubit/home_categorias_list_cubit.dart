// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/domain/use_cases/categoria_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_categorias_list_state.dart';

class HomeCategoriasListCubit extends Cubit<HomeCategoriasListState> {
  HomeCategoriasListCubit(
    this._categoriaUseCase,
  ) : super(HomeCategoriasListInitial());

  final ICategoriaUseCase _categoriaUseCase;

  Future<void> listarCategorias({bool inCache = true}) async {
    final result = await _categoriaUseCase.getCategories(inCache: inCache);

    result.fold(
      (l) =>
          emit(const HomeCategoriasListFailure(message: 'Erro desconhecido')),
      (r) => emit(HomeCategoriasListSuccess(categorias: r)),
    );
  }
}
