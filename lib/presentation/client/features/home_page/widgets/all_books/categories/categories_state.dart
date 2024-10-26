part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}
final class GettingCategories extends CategoriesState {}
final class GettingCategoriesSucess extends CategoriesState {
  const GettingCategoriesSucess({required this.lista});

  final List<Categoria> lista;
  
}
final class GettingCategoriesError extends CategoriesState {
  const GettingCategoriesError({required this.mensagem});

  final String mensagem;
}


