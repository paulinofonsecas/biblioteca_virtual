part of 'global_search_authors_bloc.dart';

/// {@template global_search_authors_state}
/// GlobalSearchAuthorsState description
/// {@endtemplate}
class GlobalSearchAuthorsState extends Equatable {
  /// {@macro global_search_authors_state}
  const GlobalSearchAuthorsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GlobalSearchAuthorsState with property changes
  GlobalSearchAuthorsState copyWith({
    String? customProperty,
  }) {
    return GlobalSearchAuthorsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template global_search_authors_initial}
/// The initial state of GlobalSearchAuthorsState
/// {@endtemplate}
class GlobalSearchAuthorsInitial extends GlobalSearchAuthorsState {
  /// {@macro global_search_authors_initial}
  const GlobalSearchAuthorsInitial() : super();
}
