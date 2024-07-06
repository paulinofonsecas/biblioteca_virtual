part of 'admin_view_book_cubit.dart';

sealed class AdminViewBookState extends Equatable {
  const AdminViewBookState();

  @override
  List<Object> get props => [];
}

final class AdminViewBookInitial extends AdminViewBookState {}

final class AdminViewBookLoading extends AdminViewBookState {}

final class AdminViewBookError extends AdminViewBookState {
  const AdminViewBookError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class AdminViewBookLoaded extends AdminViewBookState {
  const AdminViewBookLoaded(this.book);

  final BookModel book;

  @override
  List<Object> get props => [book];
}
