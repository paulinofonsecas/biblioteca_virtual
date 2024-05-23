part of 'admin_view_book_bloc.dart';

/// {@template admin_view_book_state}
/// AdminViewBookState description
/// {@endtemplate}
class AdminViewBookState extends Equatable {
  /// {@macro admin_view_book_state}
  const AdminViewBookState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AdminViewBookState with property changes
  AdminViewBookState copyWith({
    String? customProperty,
  }) {
    return AdminViewBookState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template admin_view_book_initial}
/// The initial state of AdminViewBookState
/// {@endtemplate}
class AdminViewBookInitial extends AdminViewBookState {
  /// {@macro admin_view_book_initial}
  const AdminViewBookInitial() : super();
}
