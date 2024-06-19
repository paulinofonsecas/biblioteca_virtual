part of 'global_search_bloc.dart';

/// {@template global_search_state}
/// GlobalSearchState description
/// {@endtemplate}
class GlobalSearchState extends Equatable {
  /// {@macro global_search_state}
  const GlobalSearchState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current GlobalSearchState with property changes
  GlobalSearchState copyWith({
    String? customProperty,
  }) {
    return GlobalSearchState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template global_search_initial}
/// The initial state of GlobalSearchState
/// {@endtemplate}
class GlobalSearchInitial extends GlobalSearchState {
  /// {@macro global_search_initial}
  const GlobalSearchInitial() : super();
}
