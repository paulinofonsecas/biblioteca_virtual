part of 'categorias_livro_bloc.dart';

abstract class CategoriasLivroEvent extends Equatable {
  const CategoriasLivroEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_categorias_livro_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class GetAllCategoriasLivroEvent extends CategoriasLivroEvent {
  /// {@macro custom_categorias_livro_event}
  const GetAllCategoriasLivroEvent();
}

class RemoveCategoriaLivroEvent extends CategoriasLivroEvent {
  const RemoveCategoriaLivroEvent({required this.lista, required this.item});

  /// {@macro custom_categorias_livro_event}
  final Categoria item;
  final List<Categoria> lista;
}

class AdiconarCategoriaLivroEvent extends CategoriasLivroEvent {
  const AdiconarCategoriaLivroEvent({required this.item});

  /// {@macro custom_categorias_livro_event}
  final Categoria item;
}