part of 'categorias_cubit.dart';

/// {@template categorias}
/// CategoriasState description
/// {@endtemplate}
class CategoriasState extends Equatable {
  /// {@macro categorias}
  const CategoriasState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current CategoriasState with property changes
  CategoriasState copyWith({
    String? customProperty,
  }) {
    return CategoriasState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template categorias_initial}
/// The initial state of CategoriasState
/// {@endtemplate}
class CategoriasInitial extends CategoriasState {
  /// {@macro categorias_initial}
  const CategoriasInitial() : super();
}
