part of 'admin_users_manager_cubit.dart';

/// {@template admin_users_manager}
/// AdminUsersManagerState description
/// {@endtemplate}
class AdminUsersManagerState extends Equatable {
  /// {@macro admin_users_manager}
  const AdminUsersManagerState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AdminUsersManagerState with property changes
  AdminUsersManagerState copyWith({
    String? customProperty,
  }) {
    return AdminUsersManagerState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template admin_users_manager_initial}
/// The initial state of AdminUsersManagerState
/// {@endtemplate}
class AdminUsersManagerInitial extends AdminUsersManagerState {
  /// {@macro admin_users_manager_initial}
  const AdminUsersManagerInitial() : super();
}
