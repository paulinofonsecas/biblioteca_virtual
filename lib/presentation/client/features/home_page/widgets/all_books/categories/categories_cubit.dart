import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/domain/use_cases/categoria_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  void getCategories() async {
    emit(GettingCategories());
    final useCase = getIt<ICategoriaUseCase>();
    (await useCase.getCategories()).fold(
      (l) {
        emit(GettingCategoriesError(mensagem: l.toString()));
      },
      (r) {
        emit(GettingCategoriesSucess(lista: r));
      },
    );
  }
}
