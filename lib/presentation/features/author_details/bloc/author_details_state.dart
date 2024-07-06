part of 'author_details_bloc.dart';

/// {@template author_details_state}
/// AuthorDetailsState description
/// {@endtemplate}
class AuthorDetailsState extends Equatable {
  /// {@macro author_details_state}
  const AuthorDetailsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AuthorDetailsState with property changes
  AuthorDetailsState copyWith({
    String? customProperty,
  }) {
    return AuthorDetailsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template author_details_initial}
/// The initial state of AuthorDetailsState
/// {@endtemplate}
class AuthorDetailsInitial extends AuthorDetailsState {
  /// {@macro author_details_initial}
  const AuthorDetailsInitial() : super();
}
