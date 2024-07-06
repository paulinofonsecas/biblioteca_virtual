part of 'list_books_cubit.dart';

sealed class ListBooksState extends Equatable {
  const ListBooksState();

  @override
  List<Object> get props => [];
}

final class ListBooksInitial extends ListBooksState {}

 class ListBooksLoading extends ListBooksState {}

final class ListBooksDeleteLoading extends ListBooksState {}

final class ListBooksLoaded extends ListBooksState {
  const ListBooksLoaded(this.books);

  final List<BookModel> books;

  @override
  List<Object> get props => [books];
}

final class ListBooksError extends ListBooksState {
  const ListBooksError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
