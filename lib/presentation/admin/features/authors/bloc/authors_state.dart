part of 'authors_bloc.dart';

/// {@template authors_state}
/// AuthorsState description
/// {@endtemplate}
class AuthorsState extends Equatable {
  /// {@macro authors_state}
  const AuthorsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AuthorsState with property changes
  AuthorsState copyWith({
    String? customProperty,
  }) {
    return AuthorsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template authors_initial}
/// The initial state of AuthorsState
/// {@endtemplate}
class AuthorsInitial extends AuthorsState {
  /// {@macro authors_initial}
  const AuthorsInitial() : super();
}

class DeleteAuthors extends AuthorsState {
  /// {@macro authors_initial}
  const DeleteAuthors() : super();
}
