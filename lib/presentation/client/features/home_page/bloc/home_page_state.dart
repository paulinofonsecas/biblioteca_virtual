part of 'home_page_bloc.dart';

/// {@template home_page_state}
/// HomePageState description
/// {@endtemplate}
class HomePageState extends Equatable {
  /// {@macro home_page_state}
  const HomePageState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current HomePageState with property changes
  HomePageState copyWith({
    String? customProperty,
  }) {
    return HomePageState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template home_page_initial}
/// The initial state of HomePageState
/// {@endtemplate}
class HomePageInitial extends HomePageState {
  /// {@macro home_page_initial}
  const HomePageInitial() : super();
}
