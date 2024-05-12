part of 'gestao_de_books_bloc.dart';

/// {@template gestao_de_books_state}
/// GestaoDeBooksState description
/// {@endtemplate}
class GestaoDeBooksState extends Equatable {
  /// {@macro gestao_de_books_state}
  const GestaoDeBooksState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GestaoDeBooksState with property changes
  GestaoDeBooksState copyWith({
    String? customProperty,
  }) {
    return GestaoDeBooksState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template gestao_de_books_initial}
/// The initial state of GestaoDeBooksState
/// {@endtemplate}
class GestaoDeBooksInitial extends GestaoDeBooksState {
  /// {@macro gestao_de_books_initial}
  const GestaoDeBooksInitial() : super();
}
