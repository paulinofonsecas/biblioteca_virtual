part of 'home_categorias_list_cubit.dart';

sealed class HomeCategoriasListState extends Equatable {
  const HomeCategoriasListState();

  @override
  List<Object> get props => [];
}

final class HomeCategoriasListInitial extends HomeCategoriasListState {}

final class HomeCategoriasListLoading extends HomeCategoriasListState {}

final class HomeCategoriasListFailure extends HomeCategoriasListState {
  const HomeCategoriasListFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class HomeCategoriasListSuccess extends HomeCategoriasListState {
  const HomeCategoriasListSuccess({required this.categorias});

  final List<Categoria> categorias;

  @override
  List<Object> get props => [categorias];
}
