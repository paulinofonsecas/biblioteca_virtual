part of 'get_all_books_cubit.dart';

sealed class GetAllBooksState extends Equatable {
  const GetAllBooksState();

  @override
  List<Object> get props => [];
}

final class GetAllBooksInitial extends GetAllBooksState {}

final class GetAllBooksLoading extends GetAllBooksState {}

final class GetAllBooksLoaded extends GetAllBooksState {
  const GetAllBooksLoaded(this.books);

  final List<BookModel> books;

  @override
  List<Object> get props => [books];
}

final class GetAllBooksError extends GetAllBooksState {
  const GetAllBooksError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
