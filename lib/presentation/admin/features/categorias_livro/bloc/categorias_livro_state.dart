part of 'categorias_livro_bloc.dart';

/// {@template categorias_livro_state}
/// CategoriasLivroState description
/// {@endtemplate}
class CategoriasLivroState extends Equatable {
  /// {@macro categorias_livro_state}
  const CategoriasLivroState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current CategoriasLivroState with property changes
  CategoriasLivroState copyWith({
    String? customProperty,
  }) {
    return CategoriasLivroState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template categorias_livro_initial}
/// The initial state of CategoriasLivroState
/// {@endtemplate}
class CategoriasLivroInitial extends CategoriasLivroState {
  /// {@macro categorias_livro_initial}
  const CategoriasLivroInitial() : super();
}

class GettingCategoriasLivro extends CategoriasLivroState {
  /// {@macro categorias_livro_initial}
  const GettingCategoriasLivro() : super();
}

class GettingCategoriasLivroSucess extends CategoriasLivroState {
  /// {@macro categorias_livro_initial}
  const GettingCategoriasLivroSucess({required this.lista}) : super();
  final List<Categoria> lista;
}

class GettingCategoriasError extends CategoriasLivroState {
  /// {@macro categorias_livro_initial}
  const GettingCategoriasError({required this.mensagem}) : super();
  final String mensagem;
}
