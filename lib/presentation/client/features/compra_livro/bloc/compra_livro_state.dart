part of 'compra_livro_bloc.dart';

/// {@template compra_livro_state}
/// CompraLivroState description
/// {@endtemplate}
class CompraLivroState extends Equatable {
  /// {@macro compra_livro_state}
  const CompraLivroState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current CompraLivroState with property changes
  CompraLivroState copyWith({
    String? customProperty,
  }) {
    return CompraLivroState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template compra_livro_initial}
/// The initial state of CompraLivroState
/// {@endtemplate}
class CompraLivroInitial extends CompraLivroState {
  /// {@macro compra_livro_initial}
  const CompraLivroInitial() : super();
}
