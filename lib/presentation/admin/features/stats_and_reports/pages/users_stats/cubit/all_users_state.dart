part of 'all_users_cubit.dart';

sealed class AllUsersState extends Equatable {
  const AllUsersState();

  @override
  List<Object> get props => [];
}

final class AllUsersInitial extends AllUsersState {}

final class AllUsersLoading extends AllUsersState {}

final class AllUsersLoaded extends AllUsersState {
  const AllUsersLoaded({required this.users});

  final List<UserModel> users;

  @override
  List<Object> get props => [users];
}

final class AllUsersError extends AllUsersState {
  const AllUsersError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
